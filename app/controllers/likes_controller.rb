class LikesController < ApplicationController
  def create
    @item = Item.find(params[:id])
    Like.create(user_id: current_user.id, item_id: params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    Like.find_by(user_id: current_user.id, item_id: params[:id]).destroy
  end
end
