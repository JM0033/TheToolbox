import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bikers"
export default class extends Controller {
  static targets = ["marker"]

  connect() {
    // console.log("connected to bikers")
  }

  displayBikers(event) {
    event.preventDefault();
    event.currentTarget.querySelector('.filter-biker').classList.toggle("filters-active");
    document.querySelectorAll(".biker-marker").forEach((marker) => {
      marker.classList.toggle("d-none")
    })
  }
}
