class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
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
  end

  def seller
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
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