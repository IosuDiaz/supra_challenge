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

  async syncInfluencers() {
    try {
      const response = await fetch('/sync_influencers', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
        },
      });

      if (response.ok) {        
        alert('Job encolado exitosamente');
      } else {
        alert('Error en la solicitud de sincronización');
      }
    } catch (error) {
      console.error('Error al sincronizar influencers:', error);
      alert('Hubo un problema al intentar sincronizar los influencers');
    }
  }
}