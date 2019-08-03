$(function() {
  $('#shipping_fee').on('change', function(){
    $('#shipping_method').parent().removeClass('display_none').css('margin-top', '30px')
  })

  $(document).on('change', '#category_parent', function(){
    var parent_id = $(this).val()
    $('#category_children').parent().removeClass('display_none')
    $('#category_grandchildren').parent().addClass('display_none')

    $.ajax({
      type: 'GET',
      url: '/items/set_children',
      data: {parent_id: parent_id},
      dataType: 'json'
    })
    .done(function(category){
      $("#category_children").empty()
      $("#category_children").append('<option value="" selected>---</option>')
      $.each(category.children, function(i, child){
        var children = `<option value="${child.id}">${child.name}</option>`
        $("#category_children").append(children)
      })
    })
    .fail(function(){
      console.log('error')
    })
  })

  $(document).on('change', '#category_children', function(){
    var child_id = $(this).val()
    $('#category_grandchildren').parent().removeClass('display_none')

    $.ajax({
      type: 'GET',
      url: '/items/set_grandchildren',
      data: {child_id: child_id},
      dataType: 'json'
    })
    .done(function(category){
      $("#category_grandchildren").empty()
      $("#category_grandchildren").append('<option value="" selected>---</option>')
      $.each(category.grandchildren, function(i, grandchild){
        var grandchildren = `<option value="${grandchild.id}" name="category">${grandchild.name}</option>`
        $("#category_grandchildren").append(grandchildren)
      })
    })
    .fail(function(){
      console.log('error')
    })
  })

  $(document).on('change', '#category_grandchildren', function(){
    var parent_id = $('#category_parent').val()
    if (!["5", "6", "10", "11", "13"].includes(parent_id)) {
      $('#brand').parent().removeClass('display_none').css('margin-top', '30px')
    }
  })

})