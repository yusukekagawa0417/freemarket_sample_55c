$(function(){
  // 試着ボタンを押した後、顔写真を表示し、試着終了ボタンに変化
  $(".start").on("click", function(){
    $("#tryonImgDiv").removeClass("display_none");
    $(".start").addClass("display_none");
    $(".finish").removeClass("display_none");
    $("html").animate({scrollTop: 0}, "fast");
  });

  // 試着終了ボタンを押した後、顔写真を非表示にし、試着ボタンに変化
  $(".finish").on("click", function(){
    $("#tryonImgDiv").addClass("display_none");
    $(".finish").addClass("display_none");
    $(".start").removeClass("display_none");
  });

  // 顔写真の移動・拡大・縮小
  $("#tryonImg").resizable();
  $("#tryonImgDiv").draggable();

  // 顔写真登録
  // 画像アップロード
  $(document).on('change', 'input[type= "file"]', function(){
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    reader.onload = function(e) {
      $('.icon_image').attr({ src: e.target.result });
    };
    reader.readAsDataURL(file);
  });
});