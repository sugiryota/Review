class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :category_id
    validates :audio
  end

  validates :category_id, numericality: { other_than: 1 }

  mount_uploader :audio, AudiofileUploader
  
end