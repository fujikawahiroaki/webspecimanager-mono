import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

addEventListener("turbo:load", () => {
  const el = document.querySelector("[data-controller='sidebar']");
  el && el.controller && el.controller.recalculate?.();
});


export { application }
