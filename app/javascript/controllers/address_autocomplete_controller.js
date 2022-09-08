import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"



// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = {
    apiKey: String,
    userPosition: Array,
    traceRoute: Boolean,
    routeCoordinates: Array
  }

    static targets = ["container", "address", "mapbox"]


  connect() {

    // 1. This enables to communicate with another stimulus controller (In that case launched from info_card_controller #toggleitineraryCard)
    // "This xxxx.bind enables to propagate "this" from the global environment."
    const element = document.querySelector("body")
    element.addEventListener("close:modal", this.clickOnClosingCross.bind(this))
    // 1. End

    console.log("connected to address-autocomplete")
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    })
    this.geocoder.addTo(this.containerTarget)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
    if (this.traceRouteValue) {
      this.#traceRouteFromMeetingPoint(this.routeCoordinatesValue[0], this.routeCoordinatesValue[1])
    }
  }

  #setInputValue(event) {
    // console.log(event.result.geometry.coordinates[0])
    // console.log(event.result.geometry.coordinates[1])
    this.addressTarget.value = event.result["place_name"];
    this.#addCustomToMap(event.result.geometry.coordinates[1], event.result.geometry.coordinates[0]);
    this.#addRoute(event.result.geometry.coordinates[1], event.result.geometry.coordinates[0]);
    window.map.fitBounds([this.userPositionValue, [event.result.geometry.coordinates[0], event.result.geometry.coordinates[1]]], { padding: 50 });
  }

  #traceRouteFromMeetingPoint(lat, lng) {
    // this.#addCustomToMap(lat, lng)
    this.#addRoute(lat, lng)
    // window.map.fitBounds([this.userPositionValue, [lat, lng]], { padding: 50 })
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }

  #addCustomToMap(lat, lng) {
    // console.log(window.map)
    if (this.marker) this.marker.remove()
    this.marker = new mapboxgl.Marker()
      .setLngLat([ lng, lat ])
      .addTo(window.map)
    }

  #addRoute(lat, lng) {
    const csrfToken = document.getElementsByName("csrf-token")[0].content;
    console.log({coordinates:{ longitude: lat, latitude: lng }})

    fetch("/get_route_points", {
      method: "POST",
      headers: {
        "X-CSRF-Token": csrfToken,          // 👈👈👈 you need to set token
        "Content-Type": "application/json", // 👈👈👈 To send json in body, specify this
        Accept: "application/json",         // 👈👈👈 Specify the response to be returned as json. For api only mode, this may not be needed
      },
      body: JSON.stringify({coordinates:{ longitude: lng, latitude: lat }}),
    })
    .then((response) => response.json())
    .then((data) => {
    //  console.log("data points :", data.points);
    //  console.log("data duration :", data.duration);
    //  console.log("data distance :", data.distance);

      // console.log("Success:", data);
        const routeSource = window.map.getSource("route")
        if (routeSource) {
          routeSource.setData({
            'type': 'Feature',
            'properties': {},
            'geometry': {
              'type': 'LineString',
              'coordinates': data.points
            }
          })
        } else {
          window.map.addSource('route', {
            'type': 'geojson',
            'data': {
              'type': 'Feature',
              'properties': {},
              'geometry': {
                'type': 'LineString',
                'coordinates': data.points
              }
            }
          });
          window.map.addLayer({
            'id': 'route',
            'type': 'line',
           'source': 'route',
            'layout': {
              'line-join': 'round',
              'line-cap': 'round'
            },
            'paint': {
             'line-color': '#0F469C',
             'line-width': 5
            }
          });
          this.#addCustomToMap(data.points[data.points.length -1][1], data.points[data.points.length -1][0])
          window.map.fitBounds([
            this.userPositionValue,
            [data.points[data.points.length -1][0], data.points[data.points.length -1][1]]
          ],
            { padding: 80 })
            console.log("initial:",
              this.userPositionValue,
              "final? :",
              [data.points[data.points.length -1][0], data.points[data.points.length -1][1]])
          // console.log(data.points[data.points.length -1][0])
          const hours = Math.floor(data.duration / 3600);
          const minutes = Math.floor((data.duration - (hours * 3600)) / 60);
          // const seconds = Math.round(data.duration - (hours * 3600) - (minutes * 60));
          let timeString = hours.toString().padStart(2, '0') + ':' +
          minutes.toString().padStart(2, '0')
          //  + ':' + seconds.toString().padStart(2, '0');
          const partial = `
            <div class="small-card" data-controller="info-card" data-info-card-target="itineraryCard" >
              <div class="small-card-header">
                <h2> <strong> Duration:</strong> ${timeString} min </h2>
                <h2> <strong> Distance:</strong> ${Math.round(data.distance / 1000)} km </h2>
                <div class="header-second-column">
                  <i class="fa-solid fa-xmark closing-cross" id="closing-cross-itinerary" data-action="click->info-card#toggleItineraryCard"></i>
                </div>
              </div>
            </div>
            `
          this.mapboxTarget.insertAdjacentHTML('beforeEnd', partial);
        }
        // const instructions = document.getElementById('instructions');
        // const duration = data.duration;
        // const distance = data.duration;

        // let tripInstructions = '';
        // for (const step of steps) {
        //   tripInstructions += `<li>${step.maneuver.instruction}</li>`;
        // }
        // instructions.innerHTML = `<p><strong>Trip duration: ${Math.floor(
        //  data.duration / 60
        // )} min 🚴 </strong></p><ol>${tripInstructions}</ol>`;
    })

  }
  // input(event) {
  //   console.log(event.target.value)
  // }

  clickOnClosingCross(evt) {
    const routeSource = window.map.getSource("route")
    console.log(routeSource)
    window.map.removeLayer('route')
    window.map.removeSource('route')
    this.geocoder.clear()
    this.marker.remove()
  }

  disconnect() {
    this.geocoder.onRemove()
  }
}
