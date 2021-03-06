class LikesController < ApplicationController
  before_action :set_item
  def create
    like = current_user.likes.new(item_id: @item.id)
    like.save

    @item.create_notification_by(current_user)
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: @item.id).destroy
  end
  private
  def set_item
    @item = Item.find(params[:item_id])
  end

end
