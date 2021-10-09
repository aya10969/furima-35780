class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index


  def index
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new
  end


  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
       @order_shipping_address.save
       redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end


  private


  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end


  #def shipping_address_params
  #   params.permit(:postal_code, :prefecture_id, :municipality, :address, :building_name,:telephone_number).merge(order_id: @order.id)
  #end
end
