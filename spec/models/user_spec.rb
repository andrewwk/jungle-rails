require 'rails_helper'

# It must be created with a password and password_confirmation fields
  # These need to match so you should have an example for where they are not the same
    # Has secure password has a 72 character password limit, but no minimum
    # Set class validation to 10 character minimum
  # These are required when creating the model so you should also have an example for this

# Emails must be unique and case sensitivity should not be taken into account (TEST@TEST.com should
# not be allowed if test@test.COM is in the database)

# Email, first name, and last name should also be required

RSpec.describe User, type: :model do

  context "Validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password).is_at_least(10) }
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


end
