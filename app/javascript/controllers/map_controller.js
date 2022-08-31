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
    // this.#fitMapToUser()
  }

  #addUserToMap() {
      new mapboxgl.Marker()
        .setLngLat([ this.userPositionValue[0], this.userPositionValue[1] ])
        .addTo(this.map)
      console.log(this.userPositionValue)
    }

  // #fitMapToUser() {
  //   const bounds = new mapboxgl.LngLatBounds()
  //   this.userPosition.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
  //   this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  // }
  }
