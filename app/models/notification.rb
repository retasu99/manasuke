class Notification < ApplicationRecord
  belongs_to :subject, polymorphic: true
  belongs_to :user

  enum action_type: { commented_to_own_post: 0, acknowledged_to_own_post: 1, followed_me: 2, by_posting: 3 }
end
