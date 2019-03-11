class FestLocation < ApplicationRecord
  belongs_to :fest
  belongs_to :location_type

  validates_presence_of :location_type
  validates_presence_of :fest
end
