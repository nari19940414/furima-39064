class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address
  attr_accessor :city
  attribute :house_number, :string
  attr_accessor :building_name
end
