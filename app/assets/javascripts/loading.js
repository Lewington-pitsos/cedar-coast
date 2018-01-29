$(document).on({
    ajaxStart: function() {
      console.log('rooter tooter');
    },
    ajaxStop: function() {
      console.log('long range shoter'); 
    }
});
