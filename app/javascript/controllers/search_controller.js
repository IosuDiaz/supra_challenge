import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "platform"]

  connect() {
    this.timeout = null
  }

  filter() {
    clearTimeout(this.timeout)

    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 300) // Evita enviar demasiadas peticiones
  }

  filterSelect() {
    this.element.requestSubmit() // Enviar automáticamente al cambiar el select
  }
}