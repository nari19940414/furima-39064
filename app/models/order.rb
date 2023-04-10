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
  validates :phone_number, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数値で入力してください' }
  validates :user, presence: true
  validates :item, presence: true
  validates :token, presence: true
  
end
