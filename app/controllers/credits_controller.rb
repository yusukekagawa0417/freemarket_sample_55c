class CreditsController < ApplicationController
  def new
    @user = User.find(current_user.id)
    Payjp.api_key = Rails.application.credentials.payjp_secret_key
    @customer = Payjp::Customer.retrieve(current_user.customer)
    @card_information = @customer.cards.retrieve(current_user.card)

    # 登録しているカード会社のブランドアイコンを表示するためのコードです
    @card_brand = @card_information.brand      
    @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/visa.svg?3236810361"
  end

  def create
  end
end