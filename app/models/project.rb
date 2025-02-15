class Project < ApplicationRecord
  has_many :post_works, dependent: :destroy

  validates :name, presence: true
end
