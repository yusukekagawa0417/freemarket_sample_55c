class PurchasesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
  end
  
  def create
    #支払い
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.create(
      amount: Item.find(purchase_params[:item_id]).price,
      customer: current_user.customer,
      currency: 'jpy'
    )

    #購入情報記録（receiptsテーブルにレコード追加）
    Receipt.create(purchase_params)
    redirect_to root_path

    #itemのstatus変更（0→1）
    Item.find(params[:item_id]).update(status: 1)
  end

  private

  def purchase_params
    params.permit(:item_id, :seller_id).merge(buyer_id: current_user.id)
  end
end