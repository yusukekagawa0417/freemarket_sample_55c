$( document ).on('turbolinks:load', function() {
  $('.k_ir_section__inner--form-input-default').on('change', function(){
    $('#preview').text('');
    var $files = $(this).prop('files');
    var length = $files.length;
    for (var i = 0; i < length; i++) {
      var file = $files[i];
      var reader = new FileReader();
      reader.onload = function(e) {
        var src = e.target.result;
        var img = '<img src="'+ src + '">';
        $('#preview').append(img);
      }
      reader.readAsDataURL(file);
    }
  })
});