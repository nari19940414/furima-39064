class Item < ApplicationRecord
  validates :product_name, :image, :description, presence: true

  has_one_attached :image
end
