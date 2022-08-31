import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    userPosition: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [this.userPositionValue[0], this.userPositionValue[1]],
      zoom: 14
    })
    this.#addUserToMap()
    this.#addMarkersToMap()
  }

  #addUserToMap() {
      new mapboxgl.Marker()
        .setLngLat([ this.userPositionValue[0], this.userPositionValue[1] ])
        .addTo(this.map)
      // console.log(this.userPositionValue)
    }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
        console.log(this.markersValue)
    })
  }


  }
