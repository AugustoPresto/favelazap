// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------


// External imports
import "bootstrap";


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initMapbox } from '../plugins/init_mapbox';
//= require serviceworker-companion
//= require jquery
//= require jquery_ujs


if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/serviceworker.js')
    .then(function (reg) {
      console.log('Service worker change, registered the service worker');
    });
}
// Otherwise, no push notifications :(
else {
  console.error('Service worker is not supported in this browser');
}

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initMapbox();
});
