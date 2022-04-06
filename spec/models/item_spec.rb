require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '出品できるとき' do
      it 'すべての項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない時' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end 
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name can't be blank")
      end
    
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Explanation can't be blank")
      end
      
      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it 'condition_idが1では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end
      it 'delivery_fee_idが1では出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery fee can't be blank")
      end
      it 'days_to_deliver_idが1では出品できない' do
        @item.days_to_deliver_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Days to deliver can't be blank")
      end
      it 'region_delivery_idが1では出品できない' do
        @item.region_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Region delivery can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it 'priceが300未満では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is invalid")
      end
      it 'priceが10,000,000以上では出品できない' do
        @item.price = '10000001'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is invalid")
      end
      it 'priceに半角数字以外があると保存できない' do
        @item.price = 'あ家カ１'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is invalid")
      end
    end

  end

  
end
