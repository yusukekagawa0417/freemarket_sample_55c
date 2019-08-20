class UsersController < ApplicationController
  before_action :check_user
  before_action :search_preparation

  def show
    @user = User.find(params[:id])
    @items = Item.where(seller_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def logout
  end

  def selling
    @user = User.find(params[:id])
    @items = Item.where(seller_id: current_user.id)
  end

  private
  
  def check_user
    if User.find(params[:id]) != current_user
      flash[:alert] = "権限がありません"
      redirect_to root_path
    end
  end

  #検索用の設定読み込み
  def search_preparation
    #あいまい検索用の読み込み
    @q = Item.ransack(params[:q])
    #カテゴリ表示用の読み込み
    @category_list = Category.all
  end
end