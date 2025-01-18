class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_works, dependent: :destroy

  validates :team, presence: true
  validates :name, presence: true
  validates :telephone_number, presence: true

end
