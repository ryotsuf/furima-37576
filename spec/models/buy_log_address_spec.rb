require 'rails_helper'

RSpec.describe BuyLogAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_log_address = FactoryBot.build(:buy_log_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_log_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buy_log_address.building_name = ''
        expect(@buy_log_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
        @buy_log_address.postcode = ''
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include ("Postcode can't be blank")
      end
      it 'postcodeが全角文字だと保存できないこと' do
        @buy_log_address.postcode = 'あああ２３２３'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include ("Postcode is invalid. Include hyphen(-)")
      end
      it 'postcodeは半角数字だけでは保存できないこと' do
        @buy_log_address.postcode = '11111111'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include ("Postcode is invalid. Include hyphen(-)")
      end
      it 'region_delivery_idが1だと保存できないこと' do
        @buy_log_address.region_delivery_id = '1'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include ("Region delivery must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @buy_log_address.city = ''
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include ("City can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @buy_log_address.street_address = ''
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include ("Street address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @buy_log_address.phone_number = ''
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include ("Phone number can't be blank")
      end
      it 'phone_numberは半角文字のみでないと保存できないこと' do
        @buy_log_address.postcode = 'あああああああああ'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include ("Postcode is invalid. Include hyphen(-)")
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @buy_log_address.phone_number = '123456789012'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include ("Phone number is invalid")
      end
      it 'phone_numberが9桁以下だと保存できないこと' do
        @buy_log_address.phone_number = '123456789'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include ("Phone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buy_log_address.user_id = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include ("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buy_log_address.item_id = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include ("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @buy_log_address.token = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
