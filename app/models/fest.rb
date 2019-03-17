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
  validate :date_not_in_past
  validate :incorrect_dates
  validates :end_date, presence: true
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def date_not_in_past
    if start_date < DateTime.now
      errors.add(:start_date, "la date ne peut pas être dans le passé")
    elsif end_date < DateTime.now
      errors.add(:end_date, "la date ne peut pas être dans le passé")
    end
  end
 

  def incorrect_dates
    if start_date > end_date
      errors.add(:end_date, "La date de fin ne peut pas être antérieure à la date de début")
    end
  end

  def self.carousel
    result = []
    Fest.all.each do |fest|
      result << fest
    end
    result = result.sort! {|a,b| a.start_date <=> b.start_date}
    result
  end
end
