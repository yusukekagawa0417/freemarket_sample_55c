$(document).on('turbolinks:load', function() {
  var images = [];
  var image_files = [];

  $(document).on('change', 'input[type= "file"]', function(){
    var file = $(this).prop('files')[0];
    image_files.push(file);
    var reader = new FileReader();
    
    var img = $('<div class="add_img"><div class="img_area"><img class="image"></div></div>')
    var btn = $('<div class="btn_wrapper"><a class="btn_edit">編集</a><a class="btn_delete">削除</a></div>')
    img.append(btn);
    
    reader.onload = function(e) {
      img.find('img').attr({ src: e.target.result });
    };
    
    reader.readAsDataURL(file);
    images.push(img);
    
    $('#preview').text('');
    $.each(images, function(i, image){
      image.data('image', i);
      $('#preview').append(image);
    })

    var new_image = $(
      `<input multiple="multiple" name="image[images][]" data-image=${images.length} type="file" id="item_images_attributes_0_image">`
    );
    $('.preview-btn').append(new_image);
  })

  $(document).on('click', '.btn_delete', function(){
    var target_image = $(this).parent().parent();
    var target_image_num = target_image.data('image');
    target_image.remove();
    image_files.splice(target_image_num, 1);
  })

  $('#new_item').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    formData.delete('image[images][]');
    $.each(image_files, function(i, file){
      formData.append("image[images][]", file)
    })

    $.ajax({
      url: '/items',
      type: 'POST',
      data: formData,
      contentType: false,
      processData: false
    })
    .always(function(){
      $("input[type=submit]").removeAttr("disabled");
    })
  })
});