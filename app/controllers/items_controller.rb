class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [ :show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end


  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_price, :explanation, :category_id, :product_condition_id,
                                 :shipping_charge_id, :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
    end
end
