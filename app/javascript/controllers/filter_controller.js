import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["tourism", "campsite", "bikeshop"]

  // HTML: data-filter-target="tourism"
  // JS: dataset.filterTarget = "tourism"

  connect() {
    // console.log("filter connected")
  }

  getCategory(event) {
    event.preventDefault();

    const selectedCategory = event.currentTarget.dataset.category

    if (selectedCategory == "tourism") {
      this.tourismTargets.forEach(marker => { marker.classList.toggle("d-none") });
    }
    else if (selectedCategory == "campsite") {
      this.campsiteTargets.forEach(marker => { marker.classList.toggle("d-none") });
    }
    else if (selectedCategory == "bikeshop") {
      this.bikeshopTargets.forEach(marker => { marker.classList.toggle("d-none") });
    }
  }
}
