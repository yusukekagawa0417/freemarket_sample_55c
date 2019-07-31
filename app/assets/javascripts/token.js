$(function(){
  $(document).on('click', '.k_su_section5__inner--form5-input-btn', function(e){
    e.preventDefault();
    Payjp.setPublicKey(ENV['PAYJP_PUBLIC_KEY']);
    var card = {
      number: parseInt($('.k_card-number').val()),
      cvc: parseInt($('.k_card-cvc').val()),
      exp_month: parseInt($('.k_card-exp_month').val()),
      exp_year: parseInt($('.k_card-exp_year').val()),
    };
    Payjp.createToken(card, function(status, response) {
      if(status == 200) {
        var token = response.id;
        $(".k_card-number").val("");
        $(".k_card-cvc").val("");
        $(".k_card-exp_month").val("");
        $(".k_card-exp_year").val("");
        $.ajax({
          url: "/registrations/create5",
          type: "POST",
          data: { token: token },
          dataType: 'html'
        })
      }
      else {
        alert('クレジットカード登録に失敗しました!')
      }
    });
  })
})