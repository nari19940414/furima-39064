class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address
  attr_accessor :city
  attribute :house_number, :string
  attr_accessor :building_name
  attr_accessor :prefecture
  
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :token, presence: true
  validates :postal_code, presence: true
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows(e.g. 123-4567)' }
  validates :house_number, presence: true
  validates :phone_number, presence: true
  validates :phone_number, format: { with: /\A0[5789]0-?\d{4}-?\d{4}\z/, message: 'is invalid. Input only number' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is too short' }
  validates :user, presence: true
  validates :item, presence: true
end
