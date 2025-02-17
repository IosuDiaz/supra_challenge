import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "platform"]

  connect() {
    this.timeout = null
  }

  toggleForm() {
    const form = document.getElementById("influencer-form");
    if (form.hasAttribute("hidden")) {
      form.removeAttribute("hidden");
    } else {
      form.setAttribute("hidden", "");
    }
  }

  filter() {
    clearTimeout(this.timeout)

    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 500)
  }

  filterSelect() {
    this.element.requestSubmit()
  }
}