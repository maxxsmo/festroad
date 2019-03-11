class FestLocation < ApplicationRecord
  belongs_to :fest
  belongs_to :location_type
end
