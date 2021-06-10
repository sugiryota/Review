class Message < ApplicationRecord
  belongs_to :item
  belongs_to :user
  mount_uploader :audiocomment, SoundUploader
end
