class Acknowledgement < ApplicationRecord #承認モデル（一般的なSNSにおける、いいね機能のモデル）
  belongs_to :user #ユーザーとN:1
  belongs_to :post_work #投稿とN:1

  has_one :notification, as: :subject, dependent: :destroy #Notificationモデルとポリモーフィック関連付け

  validates :user_id, uniqueness: {scope: :post_work_id} #1人のユーザーの1つの投稿に対する"承認"の重複を制限

  after_create_commit :create_notifications #承認後、通知を送る

  private

  def create_notifications #投稿者へ通知を送る
    Notification.create(subject: self, user: self.post_work.user, action_type: 1)
  end
end
