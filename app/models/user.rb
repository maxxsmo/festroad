class User < ApplicationRecord
  validates :description, length: { in: 4..1000 }
  validates :is_admin, presence: true

end
