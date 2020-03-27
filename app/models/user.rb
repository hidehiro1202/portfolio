class User < ApplicationRecord
  
#メールアドレスとパスワードの定義 
  VALID_PASSWORD_REGEX = /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
#ユーザー名登録時の条件(空白はNG)
  validates :name, presence: true
  
 #メールアドレス登録時の条件(空白はNG)
  validates :email, presence: true
#メールアドレス登録時の条件(「＠」と「co.jp」が必要)
  validates :email, format: {with: VALID_EMAIL_REGEX}
  
#パスワード登録時の条件(８文字以上３２文字以下)
  validates :password, length: { in: 8..32 }, on: :create
#パスワード登録時の条件(英字と数字が必要)
  validates :password, format: {with: VALID_PASSWORD_REGEX}, on: :create
  validates :password, presence: true, on: :create
  
  mount_uploader :image, ImageUploader
  

  has_secure_password
  
  has_one :mypage, dependent: :destroy
  accepts_nested_attributes_for :mypage
  has_many :favorites
  has_many :favorite_spots, through: :favorites, source: 'spot'
  
  has_many :clears
  has_many :clear_spots, through: :clears, source: 'spot'

  
end
