// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

document.addEventListener("DOMContentLoaded", function () {
    var closeButton = document.querySelector(".alert .btn-close");
    closeButton.addEventListener("click", function () {
      var alertDiv = this.closest(".alert");
      alertDiv.classList.add("d-none"); // Or you can use alertDiv.style.display = 'none'; to hide the alert
    });
  });

