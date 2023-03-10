// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';
import 'jquery';
import 'semantic-ui';

const scrollMessages = () => {
  const element = document.querySelector('#messages');
  if (!element) return;
  element.scrollTo(0, element.scrollHeight);
};

document.addEventListener('click', (evt) => {
  const { target } = evt;
  if (target.classList.contains('close') && target.parentElement.classList.contains('message')) {
    target.parentElement.remove();
  }
});

$(document).ready(function () {
  //initializers
  $('.ui.dropdown').dropdown();
  scrollMessages();
});

import 'channels';
