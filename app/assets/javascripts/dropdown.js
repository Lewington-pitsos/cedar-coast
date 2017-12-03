$(function() {
  $(document).on('drop', function(e) {
    toggleDropDown(e)
  })
})

function toggleDropDown(e) {
  e.preventDefault()
  $('#dropdown').toggleClass('hidden');
  $('.dropdown-button').toggleClass('active')
}
