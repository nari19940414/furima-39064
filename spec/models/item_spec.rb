require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '出品できるとき' do
      it '商品名、販売価格、商品の説明、商品のカテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、商品画像があり、かつユーザーが紐付けば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it '「商品名」がないと出品できない' do
        @item.product_name = ''
        @item.invalid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '「販売価格」がないと出品できない' do
        @item.product_price = ''
        @item.invalid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it '「商品の説明」がないと出品できない' do
        @item.product_description = ''
        @item.invalid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it '「商品のカテゴリー」が指定されていないと出品できない' do
        @item.category_id = 1
        @item.invalid?
        expect(@item.errors.full_messages).to include("カテゴリーcan't be blank")
      end
      it '「商品の状態」が指定されていないと出品できない' do
        @item.condition_id = 1
        @item.invalid?
        expect(@item.errors.full_messages).to include("商品の状態can't be blank")
      end
      it '「配送料の負担」が指定されていないと出品できない' do
        @item.delivery_pay_id = 1
        @item.invalid?
        expect(@item.errors.full_messages).to include("配送料の負担can't be blank")
      end
      it '「発送までの日数」が指定されていないと出品できない' do
        @item.delivery_span_id = 1
        @item.invalid?
        expect(@item.errors.full_messages).to include("発送までの日数can't be blank")
      end
      it '「発送元の地域」が指定されていないと出品できない' do
        @item.city_id = 1
        @item.invalid?
        expect(@item.errors.full_messages).to include("発送元の地域can't be blank")
      end
      it '「商品画像」が空では出品できない' do
        @item.image = nil
        @item.invalid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it ' 商品の価格は¥300以上でないと出品できない' do
        @item.product_price = '250'
        @item.invalid?
        expect(@item.errors.full_messages).to include('価格is out of setting range')
      end
      it ' 商品の価格は¥9,999,999以下でないと出品できない' do
        @item.product_price = '10,000,000'
        @item.invalid?
        expect(@item.errors.full_messages).to include('価格is out of setting range')
      end
      it ' 商品の価格は全角数字だと保存できない' do
        @item.product_price = '１０００'
        @item.invalid?
        expect(@item.errors.full_messages).to include('価格is out of setting range')
      end
      it ' ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end