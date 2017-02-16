$(document).ready(function() {
  // navbar transition jQuery script
  $(window).scroll(function(e){
    if ($(this).scrollTop() > 0) {
      $(".navbar-wagon").css({
        "border-bottom": "1px solid #F7F7F7",
        "background": "white"
      });
      $(".navbar-wagon-link").css({
        "color": "#333333"
      });
      $(".navbar-wagon-brand").css({
        "color": "#333333",
        "border-right": "1px solid #333333"
      });
      $(".dropdown-toggle").css({
        "color": "#333333",
      });
    }
    else {
      $(".navbar-wagon").css({
        "background": "transparent",
        "border-bottom": "none"
      });
      $(".navbar-wagon-link").css({
        "color": "white"
      });
      $(".navbar-wagon-brand").css({
        "color": "white",
        "border-right": "1px solid white"
      });
      $(".dropdown-toggle").css({
        "color": "white",
      });
    }
  });
});
