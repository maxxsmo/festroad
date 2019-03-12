require 'rails_helper'

RSpec.describe FestLocation, type: :model do
  before(:each) do 
    @fest = Fest.create(start_date: (Time.now+6000).to_date, end_date: DateTime.now+ 1.week, title: "Festival", description: "this is my super description, isnt it fun", address: "Strasbourg", website: "www.festival.com")
    @location = LocationType.create(location: "type of location: outdoors")
    @fest_location = FestLocation.create(location_type: @location, fest: @fest)
  end
  context "validation" do
    it "is valid with valid attributes" do
      expect(@fest_location).to be_a(FestLocation)
      expect(@fest_location).to be_valid
    end
    describe "Associations" do
      it {should belong_to(:fest)}
      it {should belong_to(:location_type)}
    end
  end
end
