var main = function() {
  $('.item > img').mouseenter(function() {
    $(this).animate({opacity:".2"}, 400);
  });
  $('.item > img').mouseleave(function(){
    $(this).animate({opacity:"1"},400);
  });
}

$(document).ready(main);