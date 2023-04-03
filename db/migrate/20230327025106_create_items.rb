class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product_name,             null: false
      t.text    :product_description,      null: false
      t.integer :product_price,            null: false
      t.integer :category_id,          null: false
      t.integer :condition_id,         null: false
      t.integer :delivery_pay_id,      null: false
      t.integer :city_id,              null: false
      t.integer :delivery_span_id,     null: false
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
