require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do 
    @user = User.create(first_name: "John", last_name: "Doe", description: "lol I am a great description", is_admin: true)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#first_name" do
      it "should not be valid without first_name" do
        bad_user = User.create(last_name: "Doe")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:first_name)).to eq(true)
      end
    end

    describe "#last_name" do
      it "should not be valid without last_name" do
        bad_user = User.create(first_name: "John")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:last_name)).to eq(true)
      end
    end

    describe "#description" do
    it "should not be valid if description < 4" do
      bad_user = User.create(first_name: "John", last_name: "Lol", description: "lol")
      expect(bad_user).not_to be_valid
      expect(bad_user.errors.include?(:description)).to eq(true)
    end
  end

  end

end
