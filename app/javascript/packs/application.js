// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
window.$ = $;

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import { previewImageOnFileSelect } from '../components/photo_preview';
import { validateForm } from '../components/validation';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  previewImageOnFileSelect();
  const toggleBtn = document.querySelector('.hamburger');
  const menu = document.querySelector('.navigation__menu');
  let aria = false

  toggleBtn.addEventListener("click", ( ) => {
    toggleBtn.classList.toggle('is-active');
    toggleBtn.setAttribute('aria-expanded', !aria);
    aria = !aria
    menu.classList.toggle('is-active');
  });


   window.onclick = (event) => {
    const classNames = event.target.classList;
/*    if (
      [...classNames].every(name => !/c-dropdown/g.test(name) )
    )
    {
      dropdown.nextElementSibling.classList.remove('active');
    } */
   }

     if (window.location.pathname === '/users/sign_up') {
      [...document.forms[0].elements].forEach( input => {
    input.addEventListener('blur', validateForm)
    })
  }
  if (window.location.pathname === '/users/sign_in') {
    [...document.forms[0].elements].forEach( input => {
  input.addEventListener('blur', validateForm)
  })
}
  if (window.location.pathname === '/bands/new') {
    [...document.forms[0].elements].forEach( input => {
  input.addEventListener('blur', validateForm)
  })
}
});

import { initMapbox } from '../plugins/init_mapbox'
initMapbox();
import { initAutocomplete } from '../plugins/init_autocomplete'
initAutocomplete(); 
