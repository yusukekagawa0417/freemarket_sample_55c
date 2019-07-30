class UsersController < ApplicationController
  # def new
  # end

  # def create
  # end
  
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
end