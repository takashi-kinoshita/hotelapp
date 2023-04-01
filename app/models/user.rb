class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :rooms
  has_many :reservations, dependent: :destroy
  has_one_attached :icon_image
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  def icon_image_url
    self.icon_image.attached? ? url_for(self.icon_image) : 'default_icon.png'
  end
end
