import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="poi-card"
export default class extends Controller {
  connect() {
  }
  static targets = ["infoCard"]

  closePoiInfoCard() {
    console.log(this.element,"hello")
    // this.element.classList.toggle("card-user-shown")
    // this.element.classList.toggle("card-user")
    this.element.remove()
  }
}
