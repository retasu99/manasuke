class PostWork < ApplicationRecord
  belongs_to :project
  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :acknowledgements, dependent: :destroy

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
end
