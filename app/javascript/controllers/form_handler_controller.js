import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  reset(event) {
    console.log('entro esta ak')
    if (!event.detail.success) return;

    const form = document.getElementById("influencer-form");

    // Ocultar el formulario
    form.hidden = true;

    // Resetear el formulario
    form.querySelector("form").reset();
  }
}