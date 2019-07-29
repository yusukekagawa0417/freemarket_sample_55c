class UsersController < ApplicationController
  def new
  end

  def create
  end
  
  def show
    @user = User.find(1)
  end

  def edit
    @user = User.find(1)
  end

  def update
  end

  def logout
  end
end