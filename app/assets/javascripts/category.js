$(function(){
  $('.header-bottom__left__list__category').hover(function() {
    $(this).addClass('active');
    var category_obj = $('.active').children('.category_list');
    category_obj.show();
  }, function() {
    $(this).removeClass('active');
    $(this).children('.category_list').hide();
  });

  $('.parent_list').hover(function() {
    $(this).addClass('active');
    var category_obj = $('.active').children('.child_top');
    category_obj.show();
  }, function() {
    $(this).removeClass('active');
    $(this).children('.child_top').hide();
  });

  $('.child_list').hover(function() {
    $(this).addClass('active');
    var category_obj = $('.active').children('.gchild_top');
    category_obj.show();
  }, function() {
    $(this).removeClass('active');
    $(this).children('.gchild_top').hide();
  });
});