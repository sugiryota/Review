class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true

  has_one_attached :image
  has_many :items, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :likes,dependent: :destroy
  def liked_by?(item_id)
    likes.where(item_id: item_id).exists?
  end
end
