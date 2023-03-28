require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: '', email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
      
    end
    it "パスワードが空では登録できない" do
      user = User.new(nickname: 'abe', email: 'kkk@gmail.com', password: '', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードが6文字以上でなければ登録できない' do
      user = User.new(nickname: 'abe', email: 'testmail', password: '12345', password_confirmation: '12345')
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end    

    it 'パスワードとパスワード（確認）が一致しない場合、登録できない' do
      user = User.new(nickname: 'abe', email: 'testmail', password: 'password', password_confirmation: 'different_password')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'メールアドレスが空では登録できない' do
      user = User.new(nickname: 'abe', email: '', password: 'password', password_confirmation: 'password')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    

    it "メールアドレスが重複すると登録できない" do
      user = User.create(nickname: 'abe', email: '@user.email', password: '', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end

    it 'メールアドレスは、@を含まないと登録できない' do
      user = User.new(nickname: 'abe', email: 'testmail', password: 'password', password_confirmation: 'password')
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end


  end
end