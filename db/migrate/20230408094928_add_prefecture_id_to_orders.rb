class AddPrefectureIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :prefecture_id, :integer
  end
end
