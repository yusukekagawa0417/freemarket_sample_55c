class PurchasesController < ApplicationController
  before_action :set_item

  def new
    Payjp.api_key = Rails.application.credentials.payjp_secret_key
    @customer = Payjp::Customer.retrieve(current_user.customer)
    @card_information = @customer.cards.retrieve(current_user.card)

    # 登録しているカード会社のブランドアイコンを表示するためのコードです
    @card_brand = @card_information.brand      
    case @card_brand
    when "Visa"
      @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/visa.svg?3236810361"
    # when "JCB"
    #   @card_src = "jcb.svg"
    # when "MasterCard"
    #   @card_src = "master-card.svg"
    # when "American Express"
    #   @card_src = "american_express.svg"
    # when "Diners Club"
    #   @card_src = "dinersclub.svg"
    # when "Discover"
    #   @card_src = "discover.svg"
    end
  end
  
  def create
    #支払い
    Payjp.api_key = Rails.application.credentials.payjp_secret_key
    charge = Payjp::Charge.create(
      amount: Item.find(purchase_params[:item_id]).price,
      customer: current_user.customer,
      currency: 'jpy'
    )

    #購入情報記録（receiptsテーブルにレコード追加）
    Receipt.create(purchase_params)
    redirect_to root_path

    #itemのstatus変更（0→1）
    @item.update(status: 1)
  end

  private

  def purchase_params
    params.permit(:item_id, :seller_id).merge(buyer_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end