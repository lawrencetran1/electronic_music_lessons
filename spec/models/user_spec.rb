require 'rails_helper'

RSpec.describe User, :type => :model do

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


end