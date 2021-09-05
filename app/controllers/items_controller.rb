class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :product_price , :user, :explanation, :category_id , :product_condition_id, :shipping_charge_id,:prefecture_id,:user,:days_to_ship_id)
  end
end
