class PostWork < ApplicationRecord
  belongs_to :project
  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :acknowledgements, dependent: :destroy
  has_many :acknowledged_users, through: :acknowledgements, source: :user

  has_one :notification, as: :subject, dependent: :destroy
  after_create_commit :create_notifications

  validates :name, presence: true
  validates :work, presence: true
  validates :area, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @post_work = PostWork.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @post_work = PostWork.where("name LIKE?", "#{word}%")
    elsif search == "backward_match"
      @post_work = PostWork.where("name LIKE?", "%#{word}")
    elsif search == "partial_match"
      @post_work = PostWork.where("name LIKE?", "%#{word}%")
    else 
      @post_work = PostWork.all
    end
  end

  def acknowledged_by?(user)
    acknowledgements.exists?(user_id: user.id)
  end

  
  private

  def create_notifications
    self.user.followers.each do |follower|
      notification = Notification.new
      notification.subject = self
      notification.user_id = follower.id
      notification.action_type = 3
      notification.save
    end

    self.user.following_users.each do |followed|
      notification = Notification.new
      notification.subject = self
      notification.user_id = followed.id
      notification.action_type = 3

      self.user.following_users.each do |follower|
        if Notification.exists?(subject: self, user: follower, action_type: 3)
          next
        else
          notification.save
        end
      end

    end

  end
  
end
