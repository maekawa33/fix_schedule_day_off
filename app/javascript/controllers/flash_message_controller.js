import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash-message"
export default class extends Controller {
  connect() {
    if (this.element) {
      setTimeout(() => {
        this.element.remove()
      }, 5000)
    }
  }
}
