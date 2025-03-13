import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "submitButton", "input", "titleInput" ]
  static values = { title: String }
  // this.inputTargets is an array of all elements with the input target
  // this.inputTarget is the first element with the input target

  connect() {
    console.log("connected a form controller")
    console.log(this.titleValue)
    console.log(this.titleInputTarget)
  }

  enableSubmitButton() {
    if (this.inputTargets.every(input => input.value.length > 0)) {
      this.submitButtonTarget.disabled = false
    } else {
      this.submitButtonTarget.disabled = true
    }
  }

  // value change callback
  titleValueChanged(newValue, oldValue) {
    this.titleInputTarget.value = newValue
  }

  clearTitle() {
    this.titleValue = ""
  }
}
