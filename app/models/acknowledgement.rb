class Acknowledgement < ApplicationRecord
  belongs_to :user
  belongs_to :post_work

  validates :user_id, uniqueness: {scope: :post_work}
end
