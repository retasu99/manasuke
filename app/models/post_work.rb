class PostWork < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :name, presence: true
  validates :work, presence: true
  validates :area, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

end
