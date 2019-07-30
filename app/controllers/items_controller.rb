class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      params[:images]['image'].each do |i|
        @image = @item.images.create!(image: i)
      end
      redirect_to root_path
    else
      render 'items/new'
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @image = Image.find_by(item_id: @item.id)
    @images = @item.images
    @user = User.find(@item.seller_id)
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
      images_attributes: [:image, :item_id]
      )
      .merge(seller_id: current_user.id).merge(status: 0)
  end
end