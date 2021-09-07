class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :product_name,           null: false
      t.integer :product_price,         null: false
      t.references :user,               null: false, foreign_key: true 
      t.text :explanation,              null: false
      t.integer  :category_id,          null: false
      t.integer  :product_condition_id, null: false
      t.integer :shipping_charge_id,    null: false
      t.integer :prefecture_id,         null: false
      t.integer :days_to_ship_id ,      null: false
      t.timestamps

    end
  end
end
