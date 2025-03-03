class Relationship < ApplicationRecord #フォローモデル
  belongs_to :follower, class_name: "User" #フォローするユーザーをfollowerとして定義
  belongs_to :followed, class_name: "User" #フォローされるユーザーをfollowerとして定義

  has_one :notification, as: :subject, dependent: :destroy #Notificationモデルとポリモーフィック関連付け
  after_create_commit :create_notifications #フォロー時、通知を送る

  validates :follower_id, uniqueness: {scope: :followed_id} #フォローするユーザーとされるユーザーの重複を制限


  private

  def create_notifications #フォロー時、フォローされたユーザーへ通知を送る
    Notification.create(subject: self, user: followed, action_type: 2)
  end
end
