import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "results"]

  perform() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      const query = this.inputTarget.value

      if (query.length > 2) {
        const url = new URL(this.formTarget.action)
        url.searchParams.set('query', query)

        fetch(url, {
          headers: {
            'Accept': 'text/vnd.turbo-stream.html',
            'Turbo-Frame': 'search_results'
          }
        })
        .then(response => response.text())
        .then(html => Turbo.renderStreamMessage(html))
      } else {
        this.resultsTarget.innerHTML = ''
      }
    }, 300)
  }
}
