class LikesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    like = current_user.likes.new(item_id: @item.id)
    like.save
    
    @item.create_notification_by(current_user)
    respond_to do |format|
      format.html{redirect_to request.referrer}
      format.js
    end
    
  end

  def destroy
    @item = Item.find(params[:item_id])
    @like = Like.find_by(user_id: current_user.id, item_id: @item.id).destroy
  end
end
