import { Controller } from "stimulus";
import { createConsumer } from "@rails/actioncable";

export default class extends Controller {
  connect() {
    console.log("Conectado al controlador de influencers");

    this.subscription = createConsumer().subscriptions.create("InfluencersChannel", {
      connected() {
        console.log("Conectado al canal de influencers");
      },
      
      disconnected() {
        console.log("Desconectado del canal de influencers");
      },
      
      received(data) {
        console.log("Datos recibidos en el canal de influencers:", data);
        if (data.turbo_stream) {
          // Aquí se renderiza el Turbo Stream que recibe los datos
          Turbo.renderStreamMessage(data.turbo_stream);
        }
      }
    });
  }

  disconnect() {
    console.log("Desconectando del canal de influencers");
    // Puedes desconectar la suscripción cuando el controlador se desconecte
    this.subscription.unsubscribe();
  }
}
