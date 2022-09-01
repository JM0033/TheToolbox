import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-questions"
export default class extends Controller {
  static targets = ["form", "input", "list", "counter"]
  connect() {
    console.log("the search controller is well loaded")
    console.log(this.formTarget)
    console.log(this.inputTarget)
    console.log(this.listTarget)
    console.log(this.counterTarget.innerText)
  }

  update() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    console.log(url);
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        console.log("counter:", data);
        this.listTarget.outerHTML = data
      })
    // .then(() => {
    //   this.counterTarget.innerText = this.listTarget.childElementCount + (this.listTarget.childElementCount > 1 ? " questions" : " question")
    // })
  }
}
