require 'rails_helper'

RSpec.describe Order, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: user.id)
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id, prefecture_id: 1)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it 'building_nameが空でも保存できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postcodeが3桁ハイフン4桁」でないと保存できないこと' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Enter it as follows(e.g. 123-4567)')
      end
      it '都道府県を選択していないと保存できないこと' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村(city)が空だと保存できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地(house_number)が空だと保存できないこと' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号(phone_number)が空だと保存できないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号(phone_number)が10桁以上11桁以内でないと保存できないこと' do
        @order.phone_number = '090111222'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is too short')
      end
      it '電話番号(phonenumber)が12桁以上だと保存できないこと' do
        @order.phone_number = '090111122223333'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it '電話番号(phonenumber)が半角数値でないと保存できないこと' do
        @order.phone_number = 'aaabbbbcccc'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number',
                                                                'Phone number is too short')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.invalid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order.item_id = nil
        @order.invalid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end