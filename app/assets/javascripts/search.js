// 詳細検索
$(function(){
  // リセットボタンを押した際の動作
  $('.k_search__btn--clear').on("click", function(){
    $('.k_search__group--form').val('');
    $('input').prop('checked', false);
  })
  // 「すべて」を押した際の動作
  $('.k_condition-all').on('change', function(){
    if ($(this).prop('checked')) {
      $('.k_condition').prop('checked', true);
    } else {
      $('.k_condition').prop('checked', false);
    }
  })
  $('.k_shipping_fee-all').on('change', function(){
    if ($(this).prop('checked')) {
      $('.k_shipping_fee').prop('checked', true);
    } else {
      $('.k_shipping_fee').prop('checked', false);
    }
  })
  $('.k_status-all').on('change', function(){
    if ($(this).prop('checked')) {
      $('.k_status').prop('checked', true);
    } else {
      $('.k_status').prop('checked', false);
    }
  })
  // 孫カテゴリーのチェックボックス表示 ※子カテゴリーのフォームの表示はform.jsに記載
  $('#category_children').on('change', function(){
    var child_id = $(this).val();
    $.ajax ({
      type: 'GET',
      url: '/items/set_grandchildren',
      data: {child_id: child_id},
      dataType: 'json'
    })
    .done(function(category){
      $('.k_search__category_group').empty();
      $.each(category.grandchildren, function(i, grandchild){
        var grandchild = `<div class="k_search__group--checkbox">
                            <label>
                              <input class="k_category k_checkbox" type="checkbox" value="${i}" name="q[category_id_in][]" id="q_category_id_in_${i}">
                                ${grandchild.name}
                            </label>
                          </div>`
        $('.k_search__category_group').append(grandchild)
      })
    })

  })
})