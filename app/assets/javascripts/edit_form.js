$(window).on('load', function(){
  if (location.href.match(/\/items\/\d+\/edit/)){
    // 親カテゴリーを表示(選択されているものにselected)
    $.each(gon.category_parents, function(i, parent){
      if (parent.id == gon.category_parent.id) {
        $('#category_parent').append(`<option value="${parent.id}" name="category" selected>${parent.name}</option>`)
      } else {
        $('#category_parent').append(`<option value="${parent.id}" name="category">${parent.name}</option>`)
      }
    })
    // 子カテゴリーを表示(選択されているものにselected)
    $.each(gon.category_children, function(i, child){
      if (child.id == gon.category_child.id) {
        $('#category_children').append(`<option value="${child.id}" name="category" selected>${child.name}</option>`)
      } else {
        $('#category_children').append(`<option value="${child.id}" name="category">${child.name}</option>`)
      }
    })
    // 孫カテゴリーを表示(選択されているものにselected)
    $.each(gon.category_grandchildren, function(i, grandchild){
      if (grandchild.id == gon.category_grandchild.id) {
        $('#category_grandchildren').append(`<option value="${grandchild.id}" name="category" selected>${grandchild.name}</option>`)
      } else {
        $('#category_grandchildren').append(`<option value="${grandchild.id}" name="category">${grandchild.name}</option>`)
      }
    })

    // ブランドが存在すればブランドをformに表示
    if (gon.brand) {
      $('#brand').val(gon.brand.name)
    }
  }
})