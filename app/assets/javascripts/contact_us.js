$(window).load(function() {
  $('.contact-us').on('click', function(e) {
    e.preventDefault();
    $("html, body").animate({ scrollTop: $(document).height() }, 300);
  })
  $('#page-top').on('click', function(e) {
    e.preventDefault();
    $("html, body").animate({ scrollTop: 0 }, 300);
  })
});
