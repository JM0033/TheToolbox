import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    usersMarkers: Array,
    userPosition: Array,
    hideMarkers: Boolean
  }

  // static targets = ["content"]
  static targets = ["mapbox"]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [this.userPositionValue[0], this.userPositionValue[1]],
      zoom: 1
    });

    this.#addUserToMap()
    this.#addMarkersToMap()
    this.#addUsersMarkersToMap()
    window.map = this.map;

    map.flyTo({
      center: [this.userPositionValue[0], this.userPositionValue[1]],
      zoom: 7,
      duration: 3000,
      essential: true
    });

  }

  #addUserToMap() {
    new mapboxgl.Marker()
    .setLngLat([ this.userPositionValue[0], this.userPositionValue[1] ])
    .addTo(this.map)
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div")
      // ex: data-filter-target="tourism"
      customMarker.className = "marker d-none"
      customMarker.dataset.filterTarget = marker.category.toLowerCase()
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "cover"
      customMarker.style.width = "40px"
      customMarker.style.height = "40px"
      new mapboxgl.Marker(customMarker)
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(this.map)
      // console.log(marker)
      const poiMarker = new mapboxgl.Marker(customMarker)
      poiMarker.getElement().addEventListener('click', () => {
        // console.log(marker)
        // console.log("Clicked", marker.info_card)

        // const element = document.querySelector('.small-card');
        // element.remove();
        document.querySelectorAll('.small-card, .card-user').forEach((card) => {
          card.remove();
        })
        this.mapboxTarget.insertAdjacentHTML('beforeEnd', marker.info_card);
        document.querySelector('.small-card').classList.toggle('poi');
        // console.log(document.querySelector('.small-card'))
      })
    })
  }

  #addUsersMarkersToMap() {
    this.usersMarkersValue.forEach((marker) => {
      // console.log("lat:", marker.lat, "lng:", marker.lng, "url:", marker.image_url)
      // const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      const customMarker = document.createElement("div")
      if (this.hideMarkersValue) {
        customMarker.className = "marker biker-marker d-none"
      } else {
        customMarker.className = "marker biker-marker"
      }
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "cover"
      customMarker.style.width = "40px"
      customMarker.style.height = "40px"
      const bikerMarker = new mapboxgl.Marker(customMarker)

      .setLngLat([ marker.lng, marker.lat ])
      // .setPopup(popup)
      .addTo(this.map)
      // console.log(bikerMarker)
      bikerMarker.getElement().addEventListener('click', () => {
        // console.log(marker)
        // console.log("Clicked", marker.user_card)
        document.querySelectorAll('.small-card, .card-user').forEach((card) => {
          card.remove();
        })
        this.mapboxTarget.insertAdjacentHTML('beforeEnd', marker.user_card)
      })
    })
  }

}
