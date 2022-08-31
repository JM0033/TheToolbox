import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    console.log("connected to map")

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        coordinates = [position.coords.latitude, position.coords.longitude];
        console.log(coordinates)
        const map = new mapboxgl.Map({
          container: "map",
          style: "mapbox://styles/mapbox/streets-v9",
          center: [ position.coords.latitude, position.coords.longitude ],
          zoom: 12
        })
      });
    }
  }
}
