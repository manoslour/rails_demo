import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // this.element is the element that the controller is connected to
    this.element.textContent = "Hello World!"
  }
}
