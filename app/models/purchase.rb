class Purchase < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city_id, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows(e.g. 123-4567)' }
    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
    validates :token, :city, :block, :user_id, :item_id
    validates :phone_number, format: { with: /\A0[5789]0-?\d{4}-?\d{4}\z/, message: 'is invalid. Input only number' }
  end

  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is too short' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name,
                    phone_number: phone_number, order_id: order.id)
  end
end
