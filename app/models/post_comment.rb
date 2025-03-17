class PostComment < ApplicationRecord #ある投稿へのコメントモデル
  belongs_to :user #ユーザーとN:1
  belongs_to :post_work #投稿とN:1

  validates :comment, presence: true

  has_one :notification, as: :subject, dependent: :destroy #Notificationモデルとポリモーフィック関連付け

  after_create_commit :create_notifications #コメント作成後、通知を送る


  private

  def create_notifications #投稿者へ通知を送る
      Notification.create(subject: self, user: self.post_work.user, action_type: 0)
  end
end
