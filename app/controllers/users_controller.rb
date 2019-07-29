class UsersController < ApplicationController
  # def new
  # end

  # def create
  # end
  
  def show
    @user = User.find(current_user.id)
    @items = Item.where(seller_id: @user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
  end

  def logout
  end
end