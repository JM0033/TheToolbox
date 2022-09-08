import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-filters-menu"
export default class extends Controller {
  static targets = ["btnContainer"]

  connect() {
    console.log('toggle controller ready')
  }

  toggleMenu() {
    this.element.classList.toggle('expanded')
  }
}
