import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="question-form"
export default class extends Controller {
  static targets = ["questionForm", "button", "title", "content", "questions", "counter"]

  connect() {
    console.log('hello')
  }

  toggleForm() {
    if (this.questionFormTarget.classList.contains('d-none')) {

      this.questionFormTarget.classList.remove("d-none");
      this.buttonTarget.innerText = "Hide question form"
    }
    else {
      this.questionFormTarget.classList.add('d-none')
      this.buttonTarget.innerText = "Ask question"
    }
  }

  insert(event) {
    event.preventDefault();
    fetch(this.questionFormTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.questionFormTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.inserted_item) {
          this.questionsTarget.insertAdjacentHTML("afterbegin", data.inserted_item);
        }
        this.questionFormTarget.outerHTML = data.form;
        this.questionFormTarget.classList.remove('d-none');
        this.toggleForm();
        this.counterTarget.innerHTML = data.counter
      })
      // .then(() => {
      //   this.counterTarget.innerText = this.questionsTarget.childElementCount + (this.questionsTarget.childElementCount > 1 ? " questions" : " question")
      // })
  }


}
