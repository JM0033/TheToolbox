import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    usersMarkers: Array,
    userPosition: Array,
  }

  // static targets = ["content"]
  static targets = ["btn", "lat", "long"]

  connect() {
    console.log(this.latTarget)
    console.log(this.longTarget)
    console.log(this.btnTarget)
    console.log('Coucou from meeting point controller')
    mapboxgl.accessToken = this.apiKeyValue
    this.clickMarker = new mapboxgl.Marker()

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [this.userPositionValue[0], this.userPositionValue[1]],
      zoom: 12
    })
    this.#addUserToMap()
    this.#addUsersMarkersToMap()
    this.#displayCoordinatesOnClick()
  }

  #addUserToMap() {
    new mapboxgl.Marker()
    .setLngLat([ this.userPositionValue[0], this.userPositionValue[1] ])
    .addTo(this.map)
  }

  #addUsersMarkersToMap() {
    this.usersMarkersValue.forEach((marker) => {
      console.log("lat:", marker.lat, "lng:", marker.lng, "url:", marker.image_url)
      // const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      const customMarker = document.createElement("div")
      customMarker.className = "marker biker-marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "cover"
      customMarker.style.width = "30px"
      customMarker.style.height = "40px"
      const bikerMarker = new mapboxgl.Marker(customMarker)

      .setLngLat([ marker.lng, marker.lat ])
      // .setPopup(popup)
      .addTo(this.map)
      console.log(bikerMarker)
    })
  }

  #displayCoordinatesOnClick(){
    this.map.on('click', (e) => {
      this.clickMarker
      .setLngLat([ e.lngLat.lng, e.lngLat.lat ])
      .addTo(this.map)
      console.log(e)
      console.log(e.lngLat.lng)
      console.log(e.lngLat.lat)
      this.#displayButton()
      this.latTarget.value= e.lngLat.lat
      this.longTarget.value= e.lngLat.lng
    })
  }

  #displayButton(){
    this.btnTarget.classList.remove('hidden')
  }

}
