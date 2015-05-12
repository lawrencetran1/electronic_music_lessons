require 'rails_helper'

RSpec.describe User, :type => :model do

# The below is testing the first name of the sign up user model.
        it "responds to a first name" do
            #Does the first name exist?
        expect(subject).to respond_to(:first_name)
    end

        it "is invalid without a first name" do
            #Can a user be created without a first name?
        expect(subject).to be_invalid
    end

        it "raises an error without a first name" do
            #Will it raise an error without a first name?
        expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

# The below will be testing the last name of the sign up user model.
        it "responds to a last name" do
            #Does the last name exist?
        expect(subject).to respond_to(:last_name)
    end

        it "is invalid without a last name" do
            #Can a user be created without a last name?
        expect(subject).to be_invalid
    end

        it "raises an error without a last name" do
            #Will it raise an error without a last name?
        expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end


# The below test are testing the email of the user model.
    it "responds to an email" do
        #Does the email exist?
    expect(subject)to. respond_to(:email)
end

    it "is invalid without an email" do
        #Can a user be created without an email?
    expect(subject).to be_invalid
end

    it "raises an error without an email" do
        #Will it raise an error without an email?
    expect{subjec.save!}.to raise_error(ActiveRecord::RecordInvalid)
end


end