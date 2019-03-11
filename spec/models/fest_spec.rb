require 'rails_helper'

RSpec.describe Fest, type: :model do

  before(:each) do 
   
   @fest = Fest.create(start_date: (Time.now+6000).to_date, end_date: DateTime.now+ 1.week, title: "Festival", description: "this is my super description, isnt it fun", address: "Strasbourg", website: "www.festival.com")
  
  end

  context 'validation' do
    it "is not valid without a title" do
      @fest.title = nil
      expect(@fest).to_not be_valid
    end

    it "is not valid without a description" do
      @fest.description = nil
      expect(@fest).to_not be_valid
    end
    
    it "is not valid without an address " do
      @fest.address = nil 
      expect(@fest).to_not be_valid
    end
    
  end

  describe "Associations" do
    it { should have_many(:wish_lists) }
    it { should have_many(:tags) }
    it { should have_many(:fest_locations) }
  end


end
