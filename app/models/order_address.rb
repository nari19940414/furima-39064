class OrderAddress
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name,:phone_number, :user_id, :item_id, :token
    

    with_options presence: true do
      
    validates :token, :city, :house_number, :user_id, :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    end
    validates :phone_number, numericality: { only_integer: true }, length: { minimum: 10, maximum: 11 }
    validates :phone_number, presence: true, format: { with: /\A[0-9]+\z/, message: 'は半角数値のみ入力してください。' }
   
  
    def save
     
      order = Order.create(item_id: item_id, user_id: user_id)
     
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
    end
  end
