class DonationAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name,:phone_number, :user_id, :item_id, :token

  with_options presence: true do
    
    validates :token, :city, :block, :user_id, :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  validates :phone_number, format: { with: /\A0[5789]0-?\d{4}-?\d{4}\z/, message: 'is invalid. Input only number' }

  def save
   
    order = Order.create(item_id: item_id, user_id: user_id)
   
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number order_id: order.id)
  end
end