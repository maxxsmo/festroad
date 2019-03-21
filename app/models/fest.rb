class Fest < ApplicationRecord
  has_many :wish_lists
  has_many :users, through: :wish_lists
  has_many :tags
  has_many :music_types, through: :tags
  has_many :fest_locations
  has_many :location_types, through: :fest_locations
  has_one_attached :festpic
  
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

  def self.title(title)
    festival = Fest.all
    result = []
    festival.each do |fest|
      if fest.title =~ /#{title}/i
        result << fest
      end
      if fest.address =~ /#{title}/i
        result << fest
      end
      fest.fest_locations.each do |location|
        if location.location_type.location =~ /#{title}/i
          result << fest
        end
      end
      fest.tags.each do |tag|
        if tag.music_type.style =~ /#{title}/i
          result << fest
        end
      end
        
    end
    result.uniq
  end

  def self.music(music, festival)
    result = []
    festival.each do |fest|
      Tag.where(music_type_id: music).each do |tag|
        if tag.fest == fest
          result << fest
        end
      end
    end
    result
  end

  def self.location(location, festival)
    result = []
    festival.each do |fest|
      FestLocation.where(location_type_id: location).each do |location|
        if location.fest == fest
          result << fest
        end
      end
    end
    result
  end

  def self.start_date(date, festival)
    result = []
    festival.each do |fest|
        if date <=  fest.start_date
          result << fest
        end
    end
    result
  end

  def self.end_date(date, festival)
    result = []
    festival.each do |fest|
        if date >=  fest.end_date
          result << fest
        end
    end
    result << festival
    result.flatten.uniq
  end

  def self.carousel
    result = []
    Fest.where(validation_admin: true).each do |fest|
      result << fest
    end
    result = result.sort! {|a,b| a.start_date <=> b.start_date}
    result.uniq.first(6)
  end

  def self.date(fests)
    result = []
    fests.each do |fest|
      result << fest
    end
    result = result.sort! {|a,b| a.start_date <=> b.start_date}
    result.uniq.first(6)
  end

#   #Importing JSON in Database
#   DECLARE @json
#   SET @json = festivals_details.json
  
#   SELECT * FROM  
#    OPENJSON ( @json )  
#   WITH (   
#     title   varchar '$.Fest.Title'   
#     website varchar '$.Fest.Website' 
#     address  varchar '$.Fest.Address'
#     start_date date '$.Fest.StartDate'
#     end_date date '$.Fest.EndDate'  
#    )

end
