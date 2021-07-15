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

document.addEventListener("turbolinks:load", function() {
  navbarTransform()
})

console.log('page loaded')

function navbarTransform() {

  const open = document.getElementById('open')
  const close = document.getElementById('close')
  const container = document.querySelector('.container')

  open.addEventListener('click', (event) => {
    event.preventDefault();
    console.log('open clicked')
    container.classList.add('show-nav')
  })

  close.addEventListener('click', (event) => {
    event.preventDefault();
    console.log('close clicked')
    container.classList.remove('show-nav')
  })

  window.addEventListener('click', () => {
    console.log('Page Clicked')
    console.log(open)
    console.log(close)
    console.log(container)
  })
}

