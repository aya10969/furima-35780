class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :municipality
    validates :address
  end
    validates :postal_code, presence: true,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, presence: true,numericality: {other_than: 0, message: "can't be blank"}
    validates :telephone_number, presence: true,numericality:{ only_integer: true }
   
    def save
      order = Order.create(item_id: item_id, user_id: user_id)
      # 住所を保存する
      # shipping_addres_idには、変数shipping_addresのidと指定する
      ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
    end
end