$(function(){
  $('img.o_image-sub--one').mouseover(function(){
    var selectedSrc = $(this).attr('src');
    $('img.o_image').stop().fadeOut(50,function(){
      $('img.o_image').attr('src', selectedSrc);
      $('img.o_image').stop().fadeIn(200);
    });
  });
});