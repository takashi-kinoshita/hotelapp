class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :image

  validates :image, image: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true

  def self.search(area, keyword)
    area_search = area.blank? ? all : where("address LIKE ?", "%#{area}%")
    keyword_search = keyword.blank? ? all : where("name LIKE ? OR description LIKE ?", "%#{keyword}%", "%#{keyword}%")
    area_search.merge(keyword_search)
  end

  def facility_image_url
    self.image.present? ? self.image.url : 'default_room.png'
  end

  def icon_image_url
    self.icon.present? ? self.icon.url : 'default_icon.png'
  end
end
