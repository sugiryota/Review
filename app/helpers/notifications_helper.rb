module NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    @comment = nil
    your_item = link_to 'あなたの投稿', item_path(notification), style: 'font-weight: bold;'
    @visiter_message = notification.message_id
    case notification.action
    when 'follow'
      tag.a(notification.visiter.nickname, href: user_path(@visiter), style: 'font-weight: bold;') + 'があなたをフォローしました'
    when 'like'
      tag.a(notification.visiter.nickname, href: user_path(@visiter),
                                           style: 'font-weight: bold;') + 'が' + tag.a('あなたの投稿', href: item_path(notification.item_id),
                                                                                                style: 'font-weight: bold;') + 'にいいねしました'
    when 'message'
      @message = Message.find_by(id: @visiter_message)&.comment
      tag.a(@visiter.nickname, href: user_path(@visiter),
                               style: 'font-weight: bold;') + 'が' + tag.a('あなたの投稿', href: item_path(notification.item_id),
                                                                                    style: 'font-weight: bold;') + 'にコメントしました'
    end
  end
end
