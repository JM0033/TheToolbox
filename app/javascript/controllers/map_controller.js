import { Controller } from "@hotwired/stimulus"

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
      });
    }
    map.on('load', function () {
      map.flyTo({
         center: [
            position.coords.latitude, // Example data
            position.coords.longitude // Example data
         ],
         essential: true // this animation is considered essential with respect to prefers-reduced-motion
      });
    });
  }
}
