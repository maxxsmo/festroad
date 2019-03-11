class Fest < ApplicationRecord
  has_many :wish_lists
  has_many :users, through: :wish_lists
  has_many :tags
  has_many :music_types, through: :tags
  has_many :fest_locations
  has_many :location_types, through: :fest_locations
  validates :title, presence: true, length: { in: 4..140 }
  validates :description, length: { in: 4..1000 }
  validates :address, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
 
end
