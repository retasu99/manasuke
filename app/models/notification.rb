class Notification < ApplicationRecord #通知モデル
  belongs_to :subject, polymorphic: true #subjectカラムを用いてポリモーフィック関連付けを設定
  belongs_to :user #ユーザーとN:1

  enum action_type: { commented_to_own_post: 0, acknowledged_to_own_post: 1, followed_me: 2, by_posting: 3 } #4種類のタイミングで通知することを設定
end
