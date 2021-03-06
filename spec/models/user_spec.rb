require 'rails_helper'
require 'support/factory_girl'

# User, type: :model do

RSpec.describe User, :type => :model do
let!(:user){build(:user)}


# The below is testing the first name of the sign up user model.
        it "responds to a first name" do
            #Does the first name exist?
        expect(user).to respond_to(:first_name)
    end

        it "is invalid without a first name" do
            #Can a user be created without a first name?
        expect(user).to be_invalid
    end

        it "raises an error without a first name" do
            #Will it raise an error without a first name?
        expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

# The below will be testing the last name of the sign up user model.
        it "responds to a last name" do
            #Does the last name exist?
        expect(user).to respond_to(:last_name)
    end

        it "is invalid without a last name" do
            #Can a user be created without a last name?
        expect(user).to be_invalid
    end

        it "raises an error without a last name" do
            #Will it raise an error without a last name?
        expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end


    # The below test are testing the email of the user model.
        it "responds to an email" do
            #Does the email exist?
        expect(user).to respond_to(:email)
    end

        it "is invalid without an email" do
            #Can a user be created without an email?
        expect(user).to be_invalid
    end

        it "raises an error without an email" do
            #Will it raise an error without an email?
        expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

# The below will test the password_digest.

        it "responds to a password" do
            #Does the password exist?
        expect(user). to respond_to(:password_digest)
    end

        it "is invalid without an password" do
            #Can a user be created without a password?
        expect(user). to be_invalid
    end

        it "raises an error without a password" do
            #Will it raise an error without a password??
        expect{user.save!}. to raise_error(ActiveRecord::RecordInvalid)
    end


end