// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap";

document.addEventListener("turbo:load", function () {
  // Fechar a notificação quando o botão de "dismiss" for clicado
  const closeButton = document.querySelector(".alert-dismissible .close");
  if (closeButton) {
    closeButton.addEventListener("click", function () {
      const alert = this.closest(".alert-dismissible");
      if (alert) {
        alert.remove();
      }
    });
  }
});

