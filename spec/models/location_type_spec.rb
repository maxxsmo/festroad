require 'rails_helper'

RSpec.describe LocationType, type: :model do
  
  before(:each) do 
    @location = LocationType.create(location: "type of location: outdoors")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@location).to be_a(LocationType)
      expect(@location).to be_valid
    end

    describe "#location" do
      it "should not be valid without location" do
        bad_user = LocationType.create
        expect(bad_user).not_to be_valid 
        expect(bad_user.errors.include?(:location)).to eq(true)
      end
    end
  end
end
