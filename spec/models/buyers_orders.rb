require 'rails_helper'

RSpec.describe BuyersOrders, type: :model do
  before do
    @user_1 = FactoryBot.create(:user)
    @user_2 = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user_1.id)
    @buyers_orders = FactoryBot.build(:buyers_orders, user_id: @user_2.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品を購入する' do
    context '商品を購入できるとき' do
    it 'tokenとpost_codeとprefecture_idとcityとaddressとphone_numberが正しいかつbuilding_nameが抜けていても登録できる' do
    expect(@buyers_orders).to be_valid
    end
  context '商品購入できないとき' do
    it 'tokenが空では購入できない' do
      @buyers_orders.token = ''
      @buyers_orders.valid?
      expect(@buyers_orders.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_codeが空では購入できない' do
      @buyers_orders.post_code = ''
      @buyers_orders.valid?
      expect(@buyers_orders.errors.full_messages).to include("Post code can't be blank")
    end
    it 'prefecture_idが空では購入できない' do
      @buyers_orders.prefecture_id = 1
      @buyers_orders.valid?
      expect(@buyers_orders.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空では出品できない' do
      @buyers_orders.city = ''
      @buyers_orders.valid?
      expect(@buyers_orders.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空では購入できない' do
      @buyers_orders.address = ''
      @buyers_orders.valid?
      expect(@buyers_orders.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空では購入できない' do
      @buyers_orders.phone_number = ''
      @buyers_orders.valid?
      expect(@buyers_orders.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
      @buyers_orders.post_code = '1234567'
      @buyers_orders.valid?
      expect(@buyers_orders.errors.full_messages).to include('Post code Input correctly')
    end
    it 'post_codeが前半3桁の入力でないと購入できないこと' do
      @buyers_orders.post_code = '1234-567'
      @buyers_orders.valid?
      expect(@buyers_orders.errors.full_messages).to include('Post code Input correctly')
    end
    it 'post_codeが後半4桁の入力でないと購入できないこと' do
      @buyers_orders.post_code = '12-34567'
      @buyers_orders.valid?
      expect(@buyers_orders.errors.full_messages).to include('Post code Input correctly')
    end
    it 'phone_numberが12桁以上では購入できない' do
      @buyers_orders.phone_number = '090123456789'
      @buyers_orders.valid?
      expect(@buyers_orders.errors.full_messages).to include("Phone number Input only number")
    end
    it 'phone_numberが8桁未満では購入できない' do
      @buyers_orders.phone_number = '09012345'
      @buyers_orders.valid?
      expect(@buyers_orders.errors.full_messages).to include("Phone number Input only number")
    end
    it 'phone_numberが電話番号が数字のみでないとでは購入できない' do
      @buyers_orders.phone_number = 'abc12345678'
      @buyers_orders.valid?
      expect(@buyers_orders.errors.full_messages).to include("Phone number Input only number")
    end
    it 'phone_numberが全角数字では購入できない' do
      @buyers_orders.phone_number = '０９０１２３４５６７８'
      @buyers_orders.valid?
      expect(@buyers_orders.errors.full_messages).to include("Phone number Input only number")
    end
   end
  end
 end
end