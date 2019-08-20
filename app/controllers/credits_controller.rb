class CreditsController < ApplicationController
  before_action :search_preparation
  
  def new
    @user = User.find(current_user.id)
    Payjp.api_key = Rails.application.credentials.payjp_secret_key
    @customer = Payjp::Customer.retrieve(current_user.customer)
    @card_information = @customer.cards.retrieve(current_user.card)

    # 登録しているカード会社のブランドアイコンを表示するためのコードです
    @card_brand = @card_information.brand      
    @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/visa.svg?3236810361"
  end
  
  private
  #検索用の設定読み込み
  def search_preparation
    #あいまい検索用の読み込み
    @q = Item.ransack(params[:q])
    #カテゴリ表示用の読み込み
    @category_list = Category.all
  end
end