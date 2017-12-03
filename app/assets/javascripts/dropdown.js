$(function() {
  $(document).on('drop', function(e) {
    e.preventDefault()
    $('#dropdown').toggleClass('hidden');
    $('.dropdown-button').toggleClass('active')
  })
})
