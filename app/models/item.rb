class Item < ApplicationRecord

  is_impressionable counter_cache: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user
  has_one_attached :image
  has_many :messages,dependent: :destroy
  has_many :likes,dependent: :destroy


  def self.search(search)
    if search != ""
      Item.includes(:user).joins(:user).where(['name LIKE(?) OR text LIKE(?) OR users.nickname LIKE (?) OR minicategory LIKE(?) ', "%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
      
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
  
end