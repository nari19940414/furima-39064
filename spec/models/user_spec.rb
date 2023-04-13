require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      
    end
    it "パスワードが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it "英字のみのパスワードでは登録できない" do
      @user.password = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
    
    it "数字のみのパスワードでは登録できない" do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it "全角文字を含むパスワードでは登録できない" do
      @user.password = 'ａｂｃｄｅ'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
    

    it 'パスワードが6文字以上でなければ登録できない' do
      @user.password ='12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end    

    it 'パスワードとパスワード（確認）が一致しない場合、登録できない' do
      @user.password_confirmation = 'different_password'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'メールアドレスが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールを入力してください"
    end
    

    it "メールアドレスが重複すると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'メールアドレスは、@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it '姓（全角）が空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください")
    end

    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字is invalid. Input full-width katakana characters")
    end
    
    it '名（全角）が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end
       
    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前is invalid. Input full-width katakana characters")
    end
    
     it '姓（カナ）が空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください")
    end   

    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.last_name_kana = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字（カナ）Input full-width katakana characters")

    end

    it '名（カナ）が空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
    end

    it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前（カナ）is invalid. Input full-width katakana characters.")

    end

    it '生年月日が空だと登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end 
   end
  end
end