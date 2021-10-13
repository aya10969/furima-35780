class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references    :user,   null: false, index: true
      t.references    :item,   null: false, index: true
    end
  end
end
