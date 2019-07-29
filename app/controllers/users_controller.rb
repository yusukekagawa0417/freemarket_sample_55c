class UsersController < ApplicationController
  def new
  end

  def create
  end
  
  def show
    @user = User.find(1)
  end

  def edit
  end

  def update
  end

  def logout
  end
end