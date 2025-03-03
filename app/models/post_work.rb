class PostWork < ApplicationRecord #作業の投稿モデル
  belongs_to :project #プロジェクトとN:1
  belongs_to :user #ユーザーとN:1

  has_many :post_comments, dependent: :destroy #コメントと1:N
  has_many :acknowledgements, dependent: :destroy #承認と1:N
  has_many :acknowledged_users, through: :acknowledgements, source: :user #承認したユーザーと1:N

  has_one :notification, as: :subject, dependent: :destroy #Notificationモデルとポリモーフィック関連付け
  after_create_commit :create_notifications #投稿後、通知を送る

  validates :name, presence: true #作業名の入力がなければ投稿できない
  validates :work, presence: true #作業内容の入力がなければ投稿できない
  validates :area, presence: true #作業区画の入力がなければ投稿できない
  validates :start_time, presence: true #作業開始日時の入力がなければ投稿できない
  validates :end_time, presence: true #作業終了日時の入力がなければ投稿できない

  def self.looks(search, word) #投稿されている作業を検索
    if search == "perfect_match"
      @post_work = PostWork.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @post_work = PostWork.where("name LIKE?", "#{word}%")
    elsif search == "backward_match"
      @post_work = PostWork.where("name LIKE?", "%#{word}")
    elsif search == "partial_match"
      @post_work = PostWork.where("name LIKE?", "%#{word}%")
    end
  end

  def acknowledged_by?(user) #その投稿を承認したユーザーがいるか判断
    acknowledgements.exists?(user_id: user.id)
  end

  
  private

  def create_notifications #投稿時、自分がフォローしているユーザー、自分をフォローしているユーザー（フォロワー）へ通知を送る
    self.user.followers.each do |follower| #自分のフォロワーへ通知
      notification = Notification.new
      notification.subject = self
      notification.user_id = follower.id
      notification.action_type = 3
      notification.save
    end

    self.user.following_users.each do |followed| #自分がフォローしているユーザーへ通知
      notification = Notification.new
      notification.subject = self
      notification.user_id = followed.id
      notification.action_type = 3

      self.user.following_users.each do |follower| #自分のフォロワーを、自分もフォローしている時、通知が重複しないための分岐
        if Notification.exists?(subject: self, user: follower, action_type: 3)
          next
        else
          notification.save
        end
      end

    end

  end
  
end
