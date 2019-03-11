class MusicType < ApplicationRecord
  has_many :tags
  has_many :fests, through: :tags
  validates :type, presence: true
end
