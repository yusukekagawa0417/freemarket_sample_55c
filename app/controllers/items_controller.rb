class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :seller, :edit, :update, :destroy]

  def index
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save && image_params[:images].length != 0
      image_params[:images].each do |i|
        @item.images.create(image: i, item_id: @item.id)  
      end
    else
      render 'items/new'
    end
  end
  
  def show
  end

  def seller
  end

  def edit
    gon.item = @item
    gon.images = @item.images

    require 'base64'

    gon.item_images_binary_datas = []
    
    @item.images.each do |image|
      binary_data = File.read(image.image.file.file)
      gon.item_images_binary_datas << Base64.strict_encode64(binary_data)
    end
  end

  def update
    ids = @item.images.map{|image| image.id}
    exist_ids = registered_image_params[:ids].map(&:to_i)
    exist_ids.clear if exist_ids[0] == 0
    if @item.update(item_params) && (exist_ids.length != 0 || image_params[:images][0] != " ")
      unless ids.length == exist_ids.length
        delete_ids = ids - exist_ids
        delete_ids.each do |id|
          @item.images.find(id).destroy
        end
      end

      unless image_params[:images][0] == " "
        image_params[:images].each do |image|
          @item.images.create(image: image, item_id: @item.id)
        end
      end
    else
      render 'items/edit'
    end
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
      :prefecture_id
      )
      .merge(seller_id: current_user.id).merge(status: 0)
  end

  def image_params
    params.require(:images).permit({images: []})
  end

  def registered_image_params
    params.require(:registered_images_ids).permit({ids: []})
  end
end