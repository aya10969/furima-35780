require 'rails_helper'

RSpec.describe Item, type: :model do
 
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品機能がうまくいくとき' do
      it '全て正常' do
        expect(@item).to be_valid
      end
    end
  end

  describe '商品出品機能' do
    context '商品出品機能がうまくいかない時' do
      it '画像が一枚ないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと登録できない' do
        @item.product_name  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明がないと登録できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報がないと登録できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報がないと登録できない' do
        @item. product_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it '配送料の負担の情報がないと登録できない' do
        @item.shipping_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '発送元の地域の情報がないと登録できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報がないと登録できない' do
        @item.days_to_ship_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it '価格の情報がないと登録できない' do
        @item.product_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price can't be blank")
      end
    end
  end
end