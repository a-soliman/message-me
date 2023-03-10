// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';
import 'jquery';
import 'semantic-ui';

$(document).ready(function () {
  //initializers
  $('.ui.dropdown').dropdown();
});

document.addEventListener('click', (evt) => {
  const { target } = evt;
  if (target.classList.contains('close') && target.parentElement.classList.contains('message')) {
    target.parentElement.style.opacity = 0;
  }
});
