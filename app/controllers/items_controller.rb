class ItemsController < ApplicationController
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
      .merge(seller_id: 1).merge(status: 0)
  end
end