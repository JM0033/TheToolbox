import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="poi-card"
export default class extends Controller {
  connect() {
  }
 
  closePoiInfoCard() {
    console.log(this.element,"hello")
    // this.element.classList.toggle("card-user-shown")
    // this.element.classList.toggle("card-user")
    this.element.remove()
  }
}
