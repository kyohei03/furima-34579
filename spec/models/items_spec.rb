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
    it 'nameが空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'priceが空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'descriptionが空では出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "stutas_idがない場合は出品できないこと" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it "judgment_idがない場合は出品できないこと" do
      @item.judgment_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Judgment must be other than 1")
    end
    it "cost_idがない場合は出品できないこと" do
      @item.cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost must be other than 1")
    end
    it "prefecture_idがない場合は出品できないこと" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "days_idがない場合は出品できないこと" do
      @item.days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days must be other than 1")
    end
    it 'priceが全角数字だと出品できない' do
      @item.price = "２０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
    it 'priceが299円以下だと出品できない' do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it 'priceが1000000円以上だと出品できない' do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it 'priceが半角英数混合だと出品できない' do
      @item.price = "1000rr"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
    it 'priceが半角英語だけだと出品できない' do
      @item.price = "arr"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
    it 'imageが空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
 end
end