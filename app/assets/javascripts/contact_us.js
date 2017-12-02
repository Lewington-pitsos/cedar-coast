$(document).ready(function() {
  $(document).on('click', function(e) {
    if ($(e.target).attr('id') == 'page-top') {
      e.preventDefault();
      $("html, body").animate({ scrollTop: 0 }, 300);
    } else if ($(e.target).attr('class') == 'contact-us') {
      e.preventDefault();
      $("html, body").animate({ scrollTop: $(document).height() }, 300);
    }

  });
});
