class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [ :index, :create, ]


  def index
    @order_shipping_address = OrderShippingAddress.new
  end


  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
       pay_item
       @order_shipping_address.save
       redirect_to root_path
    else
      render :index
    end
  end




  private


  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number).merge(item_id: params[:item_id], token: params[:token],user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:  @item.product_price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  #def shipping_address_params
  #   params.permit(:postal_code, :prefecture_id, :municipality, :address, :building_name,:telephone_number).merge(order_id: @order.id)
  #end
end
