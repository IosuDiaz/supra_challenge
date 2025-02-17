import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  reset(event) {
    if (!event.detail.success) return;

    const form = document.getElementById("influencer-form");

    form.hidden = true;

    form.querySelector("form").reset();
  }
}