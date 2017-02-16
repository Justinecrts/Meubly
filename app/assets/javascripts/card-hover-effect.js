$(document).ready(function (){
  $('.card-index').mouseenter(function() {
    $(this).children('.card-content').removeClass('hidden');
  });
  $('.card-index').mouseleave(function() {
    $(this).children('.card-content').addClass('hidden');
  });
});
