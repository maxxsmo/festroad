class Subscriber < ApplicationRecord
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates :email, presence: true
  validates_uniqueness_of :email

  def self.to_csv
    attributes = %w{id email}
   
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |subscriber|
        csv << subscriber.attributes.values_at(*attributes)
    end
  end
end



end
