require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品を購入できる場合' do
      it 'すべての値が入力されていれば購入できる' do
        expect(@order_delivery).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @order_delivery.building = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '商品を購入できない場合' do
      it 'post_codeが空だと購入できない' do
        @order_delivery.post_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order_delivery.post_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'delivery_are_idを選択していないと購入できない' do
        @order_delivery.delivery_area_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'municipalityが空だと購入できない' do
        @order_delivery.municipality = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できない' do
        @order_delivery.address = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと購入できない' do
        @order_delivery.telephone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁以下では購入できない' do
        @order_delivery.telephone_number = '090123456'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Telephone number is invalid. Exclude hyphen(-)')
      end
      it 'telephone_numberが12桁以上では購入できない' do
        @order_delivery.telephone_number = '090123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Telephone number is invalid. Exclude hyphen(-)')
      end
      it 'telephone_numberに半角数字以外が含まれている場合購入できない' do
        @order_delivery.telephone_number = '０９０１２３４５６７８'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Telephone number is invalid. Exclude hyphen(-)')
      end
      it 'telephone_numberが半角のハイフンを含まない正しい形式でないと購入できない' do
        @order_delivery.telephone_number = '090-1234-5678'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Telephone number is invalid. Exclude hyphen(-)')
      end
      it 'userが紐付いていないと購入できない' do
        @order_delivery.user_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できない' do
        @order_delivery.item_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
