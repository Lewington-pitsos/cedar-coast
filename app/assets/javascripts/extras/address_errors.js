$(document).ready(function(){
  $('input.continue.button.primary').on('click', function() {
    window.setTimeout(updateUnfilled, 0)
  })
});

function updateUnfilled() {
  var unfilled = $('label.error')
  $('.unfilled').removeClass('unfilled')
  unfilled.each(highlightUnfilled)
}

function highlightUnfilled(index, label) {
  $(label).prev().addClass('unfilled');
  $(label).remove();
}
