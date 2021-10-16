class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit ]
  before_action :set_item, only: [ :show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :order_to_index, only: [:edit]

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

  def edit
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
     else
     render :edit
     end
  end


  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_price, :explanation, :category_id, :product_condition_id,
                                 :shipping_charge_id, :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
    end
  
    def move_to_index
      unless current_user.id == @item.user_id
      redirect_to action: :index
      end
    end

    def order_to_index
      if @item.order.present? 
      redirect_to root_path
      end
    end
end
