require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  
    before do
      user = FactoryBot.create(:user)
      @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id)
    end

      # context '内容に問題ない場合' do
      #   it 'すべての値が正しく入力されていれば保存できること' do
      #     expect(@order_shipping_address).to be_valid
      #   end
      # end
    
    # describe '発送先情報の保存' do
      # context '内容に問題がある場合' do
        # it 'postal_codeが空だと保存できないこと' do
        #   @order_shipping_address.postal_code = ''
        #   @order_shipping_address.valid?
        #   expect(@order_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        #  end
        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @order_shipping_address.postal_code = '111111'
          @order_shipping_address.valid?
          expect(@order_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        # it 'prefecture_idを選択していないと保存できないこと' do
        #   @order_shipping_address.prefecture_id = '1'
        #   @order_shipping_address.valid?
        #   binding.pry
        # end
        # it 'municipality空だと保存できないこと' do
        #   @order_shipping_address.municipality= ''
        #   @order_shipping_address.valid?
        #   binding.pry
        # end
        # it 'addressが空だと保存できないこと' do
        #   @order_shipping_address.address  = ''
        #   @order_shipping_address.valid?
        #   binding.pry
        # end
        # it 'telephone_numberが空だと保存できないこと' do
        #   @order_shipping_address.telephone_number  = ''
        #   @order_shipping_address.valid?
        #   binding.pry
        # end
        # it 'telephone_numberは0桁以上11桁以内の半角数値のみしか保存できないこと' do
        #   @order_shipping_address.telephone_number = '123-4569-7899'
        #   @order_shipping_address.valid?
        #   binding.pry
        # end
      # end

    # end
end