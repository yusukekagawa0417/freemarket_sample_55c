$(function(){
  $(document).on('click', '.o_item__sub--left-btn', function(e){
    e.preventDefault();
    var url = location.href + "/likes" 
    var id = location.href.slice(-1);
    $.ajax({
      url: url,
      type: "POST",
      data: {item_id: id},
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(likes) {
      $('.k_like-quantity').empty();
      $('.k_like-quantity').append(likes.length);
    })
    .fail(function() {
      alert('いいね！に失敗しました')
    });
  });
});