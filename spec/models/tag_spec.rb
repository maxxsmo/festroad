require 'rails_helper'

RSpec.describe Tag, type: :model do
  before(:each) do 
    @fest = Fest.create(start_date: (Time.now+6000).to_date, end_date: DateTime.now+ 1.week, title: "Festival", description: "this is my super description, isnt it fun", address: "Strasbourg", website: "www.festival.com")
    @music = MusicType.create(style: "rock")
    @tag = Tag.create(music_type: @music, fest: @fest)
  end
  context "validation" do
    it "is valid with valid attributes" do
      expect(@tag).to be_a(Tag)
      expect(@tag).to be_valid
    end
    describe "Associations" do
      it {should belong_to(:fest)}
      it {should belong_to(:music_type)}
    end
  end
end
