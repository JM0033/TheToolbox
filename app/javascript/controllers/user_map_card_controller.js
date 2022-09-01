import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-map-card"
export default class extends Controller {
  connect() {
    console.log("user_map_controller started...")
  }

closeUserMapCard() {
  console.log(this.element,"hello")
  // this.element.classList.toggle("card-user-shown")
  // this.element.classList.toggle("card-user")
  this.element.remove()
}

}
