// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import { createConsumer } from "@rails/actioncable"


const application = Application.start()
eagerLoadControllersFrom("controllers", application)

application.debug = false
window.Stimulus   = application

window.App ||= {};
window.App.cable = createConsumer();

export { application }
