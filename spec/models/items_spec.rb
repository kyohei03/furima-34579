require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item,user_id: @user.id)
 
  end
  
  describe '商品出品する' do
    context '商品出品できるとき' do
    it 'imageとnameとpriceとdescriptionとstatus_idとjudgment_idとcost_idとdays_idとprefecture_idが正しれば登録できる' do
    expect(@item).to be_valid
    end
  end
    context '商品出品できないとき' do
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "stutas_idがない場合は登録できないこと" do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end
   end
 end
end