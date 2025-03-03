class Admin < ApplicationRecord #管理者用モデル
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  devise authentication_keys: [:email] #メールアドレス情報を管理者ログイン時に許可する
end
