$(function() {
  // 配送料の負担を選んだら配送方法を表示
  $('#shipping_fee').on('change', function(){
    $('#shipping_method').parent().removeClass('display_none').css('margin-top', '30px')
  })

  // 親カテゴリーを選んだら子カテゴリーを表示
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
      alert('error')
    })
  })

  // 子カテゴリーを選んだら孫カテゴリーを表示
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
      alert('error')
    })
  })

  // 孫カテゴリーを選んだら、親カテゴリーの種類によってブランド欄を表示
  $(document).on('change', '#category_grandchildren', function(){
    var parent_id = $('#category_parent').val()
    if (!["5", "6", "10", "11", "13"].includes(parent_id)) {
      $('#brand').parent().removeClass('display_none').css('margin-top', '30px')
    }
  })

  // ブランド欄に入力したらインクリメンタルサーチ 
  $(document).on('keyup', '#brand', function(){
    var brand_input = $(this).val()
    $('#brand-result').removeClass('display_none')
    $('#brand-result').empty()

    $.ajax({
      type: 'GET',
      url: '/items/brand',
      data: {brand_input: brand_input},
      dataType: 'json'
    })
    .done(function(brands){
      if (brands.length != 0){
        $.each(brands, function(i, brand){
          var html = `<li data-brand-id="${brand.id}" class="brand-list">${brand.name}</li>`
          $('#brand-result').append(html)
        })
      }
    })
    .fail(function(){
      alert('error')
    })
  })

  // インクリメンタルサーチの結果をクリックしたらフォームに補完
  $(document).on('click', '.brand-list', function(){
    var brand_name = $(this).text()
    $('#brand').val(brand_name)
    $('#brand-result').addClass('display_none')
  })

})