// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:load', () => {
  const flashMessages = document.querySelectorAll('.flash');
  flashMessages.forEach((message) => {
    setTimeout(() => {
      message.remove();
    }, 3000);
  });
});
