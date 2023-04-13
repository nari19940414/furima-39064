require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tokenを入力してください")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal codeを入力してください")
      end
      it 'postal_codeが3桁4桁」でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal codeis invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '都道府県を選択していないと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecturecan't be blank")
      end
      it '市区町村(city)が空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Cityを入力してください")
      end
      it '番地(house_number)が空だと保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House numberを入力してください")
      end
      it '電話番号(phone_number)が空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone numberは数値で入力してください")
      end
      it '電話番号(phone_number)が10桁以上11桁以内でないと保存できないこと' do
        @order_address.phone_number = '090111222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include'Phone numberは10文字以上で入力してください'
      end
      
      it '電話番号(phone_number)が12桁以上だと保存できないこと' do
        @order_address.phone_number = '090111122223333'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include'Phone numberは11文字以内で入力してください'
      end
      it '電話番号(phone_number)が半角数値でないと保存できないこと' do
        @order_address.phone_number = 'aaabbbbcccc'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone numberは数値で入力してください')

      end
      
      
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.invalid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.invalid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end

      
    end
  end
end