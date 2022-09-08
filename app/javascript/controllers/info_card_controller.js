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

  toggleItineraryCard(){
    this.element.classList.toggle("small-card-hidden")
    this.element.classList.toggle("small-card")
    //1. This enables to call a function in another controller(in that case calles in address_autocomplete_controller)
    // We are creating a customized event, activated here. Which will be listened in the other controller.
    const element = document.querySelector("body")
    const event = new CustomEvent("close:modal")
    element.dispatchEvent(event)
    //1. End
  }
}
