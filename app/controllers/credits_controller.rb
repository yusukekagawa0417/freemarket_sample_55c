class CreditsController < ApplicationController
  def new
    @user = User.find(1)
  end

  def create
  end
end