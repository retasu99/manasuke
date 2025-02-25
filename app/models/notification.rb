class Notification < ApplicationRecord
  belongs_to :subject, polymorphic: true
  belongs_to :user

  enum action_type: { commented_to_own_post: 0, acknowledged_to_own_post: 1, followed_me: 2, to_follower_by_post: 3 }
end
