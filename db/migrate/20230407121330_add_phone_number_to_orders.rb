class AddPhoneNumberToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :phone_number, :string
  end
end
