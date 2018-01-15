var message = '<div class="flash success">Currently staging Payment Gateway, this may take a few moments...</div>'

$(document).ready(function() {
  if ($("#payment").length) {
    $('#content').prepend( message )
  }
});
