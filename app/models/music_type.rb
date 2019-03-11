class MusicType < ApplicationRecord
  has_many :tags
  has_many :fests, through: :tags
  validates :style, presence: true
end
