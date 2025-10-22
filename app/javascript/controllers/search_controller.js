// app/javascript/controllers/search_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "form", "results"]

  connect() {
    this.timeout = null
  }

  perform() {
    clearTimeout(this.timeout)

    const query = this.inputTarget.value

    if (query.length < 2) {
      this.resultsTarget.innerHTML = ""
      return
    }

    // Debounce de 300ms
    this.timeout = setTimeout(() => {
      this.formTarget.requestSubmit()
    }, 300)
  }
}
