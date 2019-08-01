class LikesController < ApplicationController
  def create
    like = Like.where(like_params)

    if like[0] == nil
      Like.create(like_params)
    else
      Like.where(like_params)[0].destroy
    end

    @likes = Item.find(params[:item_id]).likes

    respond_to do |format|
      format.html { redirect_to item_path(params[:item_id]) }
      format.json
    end
  end

  private
  def like_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

end