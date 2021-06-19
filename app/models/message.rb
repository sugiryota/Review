class Message < ApplicationRecord
  belongs_to :item
  belongs_to :user
  mount_uploader :audiocomment, SoundUploader
  validates :comment, presence: true, unless: :audiocomment?
  validates :audiocomment, presence: true, unless: :comment?
end
