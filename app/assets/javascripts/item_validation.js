$(window).on('load', function(){
  var error_image = $('.error_image')
  var error_name = $('.error_name')
  var error_description = $('.error_description')
  var error_category = $('.error_category')
  var error_condition = $('.error_condition')
  var error_shipping_fee = $('.error_shipping_fee')
  var error_shipping_method = $('.error_shipping_method')
  var error_prefecture_id = $('.error_prefecture_id')
  var error_shipping_date = $('.error_shipping_date')
  var error_price = $('.error_price')

  $('#new_item').on('submit', function(e) {
    if (error_image.val() == "") {
      $(error_image).text('画像がありません')
    }
    if (error_name.val() == "") {
      $(error_name).text('入力してください')
    }
    if (error_description.val() == "") {
      $(error_description).text('入力してください')
    }
    if (error_category.val() == "") {
      $(error_category).text('入力してください')
    }
    if (error_condition.val() == "") {
      $(error_condition).text('入力してください')
    }
    if (error_shipping_fee.val() == "") {
      $(error_shipping_fee).text('入力してください')
    }
    if (error_shipping_method.val() == "") {
      $(error_shipping_method).text('入力してください')
    }
    if (error_prefecture_id.val() == "") {
      $(error_prefecture_id).text('入力してください')
    }
    if (error_shipping_date.val() == "") {
      $(error_shipping_date).text('入力してください')
    }
    if (error_price.val() == "") {
      $(error_price).text('入力してください')
    }
  })
})