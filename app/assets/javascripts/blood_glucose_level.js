$(document).on('turbolinks:load', function() {
  $('#blood_glucose_checked_at').datetimepicker({
    format: "YYYY/MM/DD HH:mm",
    minDate: Date(),
    maxDate: new Date(Date.now()),
    icons: {
      up: 'fas fa-arrow-up',
      down: 'fas fa-arrow-down',
      previous: 'fas fa-chevron-left',
      next: 'fas fa-chevron-right',
      close: 'fas fa-times'
    },
    buttons: {showClose: true }
  });