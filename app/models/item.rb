class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  has_one_attached :image

 
 with_options presence: true do
   validates :product_name
   validates :product_price
   validates :explanation  
   validates :category_id 
   validates :product_condition_id 
   validates :shipping_charge_id  
   validates :prefecture_id 
   validates :days_to_ship_id  
   validates :image 
 end

 
end
