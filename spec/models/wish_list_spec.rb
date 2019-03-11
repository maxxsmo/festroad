require 'rails_helper'

RSpec.describe WishList, type: :model do
  before(:each) do 
    @user = User.create(first_name: "John", last_name: "Doe", description: "lol I am a great description", is_admin: true)
    @fest = Fest.create(start_date: (Time.now+6000).to_date, end_date: DateTime.now+ 1.week, title: "Festival", description: "this is my super description, isnt it fun", address: "Strasbourg", website: "www.festival.com")
    @wish = WishList.create(user: @user, fest: @fest)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@wish).to be_a(WishList)
      expect(@wish).to be_valid
    end

    describe "#fest" do
      it "should not be valid without fest" do
        bad_user = WishList.create(user: @user)
        expect(bad_user).not_to be_valid 
        expect(bad_user.errors.include?(:fest)).to eq(true)
      end
    end

    describe "#user" do
      it "should not be valid without user" do
        bad_user = WishList.create(fest: @fest)
        expect(bad_user).not_to be_valid 
        expect(bad_user.errors.include?(:user)).to eq(true)
      end
    end
  end
end
