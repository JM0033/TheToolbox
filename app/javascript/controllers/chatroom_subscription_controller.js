import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
// these are the values we will retrieve from the DOM
// The userId will be the value we will use to know wether
// the user is a recipient of the message or the sender
  static values = {
  chatroomId: Number,
  userId: Number
  }
  static targets = [ 'messages' ]

  connect() {
    this.channel = createConsumer().subscriptions.create(
    { channel: 'ChatroomChannel', id: this.chatroomIdValue },
    { received: this.#processMessage.bind(this) }
    )
    this.#scrollToBottom()
  }

  disconnect() {
    this.channel.unsubscribe()
  }

  resetForm(event) {
    event.target.reset()
  }

  #processMessage(data) {
    const sender = this.userIdValue == data.user_id
    // Use this method to transform the received HTML string into
    // an DomElement so that we can use .classList method on it
    const msgElement = this.#buildHTML(data.html)

    // This is where we will remove the existing 'sender' class
    // on the received partial HTML if the message.user.id is different than
    // the current_user's
    // So that, in that case, the message will display on the left
    if (!sender) msgElement.classList.remove('sender')
    if (!sender) msgElement.querySelector('.username').innerText = data.username

    this.#insertMessage(msgElement)
    this.#scrollToBottom()
  }

  #buildHTML(string) {
    const tmpDiv = document.createElement('div')
    tmpDiv.innerHTML = string
    return tmpDiv.firstElementChild
  }

  #insertMessage(element) {
    this.messagesTarget.appendChild(element)
  }

  #scrollToBottom() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
