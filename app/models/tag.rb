class Tag < ApplicationRecord
  belongs_to :fest
  belongs_to :music_type

  validates_presence_of :fest
  validates_presence_of :music_type
end
