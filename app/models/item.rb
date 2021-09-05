class Item < ApplicationRecord

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
