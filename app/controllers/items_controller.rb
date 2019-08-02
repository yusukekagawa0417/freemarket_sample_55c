class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :seller, :edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc).limit(4)
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save && params[:image][:images].length != 0
      params[:image][:images].each do |i|
        @item.images.create!(image: i)
      end
      redirect_to root_path
    else
      @item.images.build
      render 'items/new'
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @images = @item.images
    @image = @images.first
    @user = User.find(@item.seller_id)
  end

  def seller
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :condition,
      :shipping_fee,
      :shipping_date,
      :price,
      :prefecture_id,
      images_attributes: [:image, :item_id]
      )
      .merge(seller_id: current_user.id).merge(status: 0)
  end
end