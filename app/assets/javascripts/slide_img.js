$(function(){
  $('.o_image-sub--one').mouseover(function(){
    var selectedSrc = $(this).attr('src');
    if (selectedSrc.match(/mp4/) || selectedSrc.match(/mov/) || selectedSrc.match(/webm/)) {
      $('.image_zone').addClass('display_none')
      $('.video_zone').removeClass('display_none')
      $('.video_zone').html(`<video src="${selectedSrc}" controls="controls" autobuffer="true" width="300px" height="300px"></video>`)
    } else {
      $('.video_zone').addClass('display_none')
      $('.image_zone').removeClass('display_none')
      $('.image_zone').html(`<img src="${selectedSrc}" width="300px" height="300px">`)
    }
  });
});