class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_works, dependent: :destroy #投稿と1:N
  has_many :post_comments, dependent: :destroy #コメントと1:N
  has_many :acknowledgement, dependent: :destroy  #承認と1:N

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #誰かをフォローしている関連付け
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #誰かにフォローされている関連付け

  has_many :following_users, through: :active_relationships, source: :followed #自分がフォローしているユーザー情報を取得
  has_many :followers, through: :passive_relationships, source: :follower #自分をフォローしているユーザー情報を取得

  has_many :notifications, dependent: :destroy #通知と1:N

  validates :team, presence: true #所属の入力がなければユーザー登録できない
  validates :name, presence: true #氏名の入力がなければユーザー登録できない
  validates :telephone_number, presence: true #電話番号の入力がなければユーザー登録できない

  def self.looks(search, word) #ユーザーを検索
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?", "#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?", "%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?", "%#{word}%")
    end
  end

  def followed_by?(user) #特定のユーザーをフォローしている人がいるか判断
    passive_relationships.exists?(follower_id: user.id)
  end
end
