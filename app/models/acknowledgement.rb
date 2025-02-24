class Acknowledgement < ApplicationRecord
  belongs_to :user
  belongs_to :post_work

  has_one :notification, as: :subject, dependent: :destroy

  validates :user_id, uniqueness: {scope: :post_work_id}

  after_create_commit :create_notifications

  private

  def create_notifications
    Notification.create(subject: self, user: self.post_work.user, action_type: 1)
  end
end
