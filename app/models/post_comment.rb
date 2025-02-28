class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_work

  has_one :notification, as: :subject, dependent: :destroy
  after_create_commit :create_notifications


  private

  def create_notifications
#    if post_work.user.id == current_user.id
      Notification.create(subject: self, user: self.post_work.user, action_type: 0)
#    end
  end
end
