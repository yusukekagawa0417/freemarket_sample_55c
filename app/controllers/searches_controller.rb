class SearchesController < ApplicationController
  before_action :prepare_detail_search

  def search
  end

  def category
  end

  #詳細検索結果表示
  def detail_search
    tmp = Item.search(detail_search_params)
    @items = tmp.result.includes(:category, :brand)
  end

  private

  #詳細検索用の入力画面表示のために各パラメーター準備
  def prepare_detail_search
    @q = Item.ransack(params[:q])
    @categories = Category.where(ancestry: nil)
    @brands = Brand.all
  end

  def detail_search_params
    params.require(:q)
    .permit(:name_cont, 
            {category_id_in: []}, 
            :brand_name_cont, 
            :price_gteq, 
            :price_lteq, 
            {condition_in: []}, 
            {shipping_fee_in: []}, 
            {status_in: []})
  end
end
