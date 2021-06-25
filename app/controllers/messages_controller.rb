class MessagesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @message = @item.messages.new(message_params)
    if @message.save
      redirect_to "/items/#{@message.item.id}"
      @message.item.create_notification_message!(current_user, @message.id)

    end
  end

  private

  def message_params
    params.require(:message).permit(:comment, :audiocomment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
