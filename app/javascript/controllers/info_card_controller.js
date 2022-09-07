import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="info-card"
export default class extends Controller {
  connect() {
  }

  closeInfoCard() {
    console.log(this.element,"hello")
    // this.element.classList.toggle("card-user-shown")
    // this.element.classList.toggle("card-user")
    this.element.remove()
  }
}
