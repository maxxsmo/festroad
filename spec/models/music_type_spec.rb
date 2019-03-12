require 'rails_helper'

RSpec.describe MusicType, type: :model do

  before(:each) do 
    @music = MusicType.create(style: "style: rock")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@music).to be_a(MusicType)
      expect(@music).to be_valid
    end

    describe "#style" do
      it "should not be valid without style" do
        bad_user = MusicType.create
        expect(bad_user).not_to be_valid 
        expect(bad_user.errors.include?(:style)).to eq(true)
      end
    end
  end
end
