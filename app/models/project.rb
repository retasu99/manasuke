class Project < ApplicationRecord #プロジェクトモデル
  has_many :post_works, dependent: :destroy #投稿と1:N
  validates :name, presence: true #プロジェクト名の入力がなければ新規作成できない
end
