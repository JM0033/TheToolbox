import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    usersMarkers: Array,
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
    this.#addUsersMarkersToMap()
  }

  #addUserToMap() {
    new mapboxgl.Marker()
      .setLngLat([ this.userPositionValue[0], this.userPositionValue[1] ])
      .addTo(this.map)
    }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      const customMarker = document.createElement("div")
      customMarker.className = "marker d-none"
      // ex: data-filter-target="tourism"
      customMarker.dataset.filterTarget = marker.category.toLowerCase()
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "cover"
      customMarker.style.width = "30px"
      customMarker.style.height = "40px"
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #addUsersMarkersToMap() {
    this.usersMarkersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      const customMarker = document.createElement("div")
      customMarker.className = "marker biker-marker d-none"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "cover"
      customMarker.style.width = "30px"
      customMarker.style.height = "40px"

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lat, marker.lng ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }
}
