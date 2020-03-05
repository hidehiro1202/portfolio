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
  validates :password, length: { in: 8..32 } 
#パスワード登録時の条件(英字と数字が必要)
  validates :password, format: {with: VALID_PASSWORD_REGEX}
  

  has_secure_password
  
  has_many :mypages
  has_many :favorites
  has_many :favorite_spots, through: :favorites, source: 'spot'
  
end
