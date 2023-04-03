class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_pay
  belongs_to :city
  belongs_to :delivery_span
  has_one_attached :image
  validates :user, presence: true
  validates :product_name, :product_description, :image, presence: true
  validates :category_id, :condition_id, :delivery_pay_id, :city_id, :delivery_span_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :product_price, presence: true, numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is out of setting range' } do
  end 
end
