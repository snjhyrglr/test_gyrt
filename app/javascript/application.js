// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = true

import "controllers"
import * as bootstrap from "bootstrap"
window.bootstrap = bootstrap

// document.addEventListener("turbo:load", () => {
//   var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
//   var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
//     return new bootstrap.Tooltip(tooltipTriggerEl)
//   })
// })

import jQuery from "jquery"
window.jQuery = jQuery // <- "select2" will check this
window.$ = jQuery


import "@nathanvda/cocoon"
import "vanilla-nested"
import "@fortawesome/fontawesome-free"
// import "bootstrap"
