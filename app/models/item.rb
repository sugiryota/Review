class Item < ApplicationRecord
  is_impressionable counter_cache: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user
  has_one_attached :image
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :notifications, dependent: :destroy

  def self.search(search)
    if search != ''
      Item.includes(:user).joins(:user).where([
                                                'name LIKE(?) OR text LIKE(?) OR users.nickname LIKE (?) OR minicategory LIKE(?) ', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"
                                              ])

    else
      Item.includes(:user).order('created_at DESC')
    end
  end

  with_options presence: true do
    validates :name
    validates :category_id
    validates :audio
  end

  validates :category_id, numericality: { other_than: 1 }

  mount_uploader :audio, AudiofileUploader

  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      item_id: id,
      visited_id: user_id,
      action: "like"
    )
    notification.save if notification.valid?
end

  def create_notification_message!(current_user,message_id)
    temp_ids = Message.select(:user_id).where(item_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_message!(current_user, comment_id,temp_id['user_id'])
    end
    save_notification_message!(current_user,message_id,user_id) if temp_ids.blank?
  end

  def save_notification_message!(current_user,message_id,visited_id)

    notification = current_user.active_notifications.new(
      item_id: id,
      message_id: message_id,
      visited_id: visited_id,
      action: 'message'
    )
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
  
end
