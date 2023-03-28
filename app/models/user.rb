class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :encrypted_password, :password, :password_confirmation, length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ } #半角英数字6文字以上
  validates :last_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } #名前苗字
  validates :last_name_kana, :first_name_kana, presence: true
  validates :birth_date, presence: true #生年月日
  validates :last_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'Input full-width katakana characters' }
  validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
end
