class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :wish_lists
  has_many :fests, through: :wish_lists

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, allow_nil: true,  length: { in: 4..1000 }
  validates :is_admin, default: false
  
end
