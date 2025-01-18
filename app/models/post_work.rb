class PostWork < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :name, presence: true
  validates :work, presence: true
  validates :area, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true

end
