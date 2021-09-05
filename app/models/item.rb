class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
 
 with_options presence: true do
   validates :product_name
   validates :product_price
   validates :explanation  
   validates :category_id 
   validates :product_condition_id 
   validates :shipping_charge_id  
   validates :prefecture_id 
   validates :ays_to_ship_id  
 end

 
end
