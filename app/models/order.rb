class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address
  attr_accessor :token
  
  validates :postal_code, presence: true 
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows(e.g. 123-4567)' }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :house_number, presence: true

  validates :phone_number, presence: true, numericality: { only_integer: true, message: 'Input only number' }, length: { minimum: 10, maximum: 11 }
  validates :user, presence: true
  validates :item, presence: true
  validates :token, presence: true
  
end
