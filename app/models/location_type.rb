class LocationType < ApplicationRecord
  has_many :fest_locations
  has_many :fests, through: :fest_locations
  validates :location, presence: true
end
