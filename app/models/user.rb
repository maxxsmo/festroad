class User < ApplicationRecord
  has_many :wish_lists
  has_many :fests, through: :wish_lists

  validates :description, length: { in: 4..1000 }
  validates :is_admin, presence: true

end
