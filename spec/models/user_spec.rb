require 'rails_helper'
# require '/Users/andrewkim/lighthouse/lhl17projects/jungle-rails/app/models/user'
require_relative '../../app/models/user'

RSpec.describe User, type: :model do

  context "Validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    it { is_expected.to have_many(:reviews) }
  end

  context "Email uniqueness and presence" do
    before(:each) do
      @user = User.create({
        name: "The Hulk",
        email: "hulk@smash.com",
        password: "dontmakemeangry",
        password_confirmation: "dontmakemeangry"
        })
    end

    it "Should pass email uniqueness validation" do
      @user1 = User.create({
        name: "Steve Rogers",
        email: "cap@usa.gov",
        password: "usausausausa",
        password_confirmation: "usausausausa"
        })
      expect(@user1).to be_valid
    end

    it "Should not save because the email is already assigned to a different user" do
      @user1 = User.new({
        name: "John Wick",
        email: "hulk@smash.com",
        password: "wheresmycar",
        password_confirmation: "wheresmycar"
        })
      expect(@user1).not_to be_valid
    end
  end


  context "Password validations" do

    it "Should have a valid password length and password confirmation, and save." do
      @user = User.create({
        name: "The Hulk",
        email: "hulk@smash.com",
        password: "dontmakemeangry",
        password_confirmation: "dontmakemeangry"
        })
      expect(@user).to be_valid
    end

    it "Should not save because the password is too short" do
      @user = User.create({
        name: "The Hulk",
        email: "hulk@smash.com",
        password: "test",
        password_confirmation: "test"
        })
      expect(@user).not_to be_valid
    end

    it "Should not save because the password confirmation does not match" do
      @user = User.create({
        name: "The Hulk",
        email: "hulk@smash.com",
        password: "dontmakemeangry",
        password_confirmation: "thoristhebest"
        })
      expect(@user).to_not be_valid
    end
  end

  context ".authenticate_with_credentials" do

    before(:each) do
      @user = User.create({
        name: "test",
        email: "test@test.com",
        password: "password12345",
        password_confirmation: "password12345"
        })
    end

    it 'Use authenticate_with_credentials method to verify email and password valid' do
      @email = "test@test.com"
      @password = "password12345"
      @user1 = User.authenticate_with_credentials(@email, @password)
      expect(@user1).to eq(@user)
    end
  end


end
