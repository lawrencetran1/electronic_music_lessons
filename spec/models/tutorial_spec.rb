require 'rails_helper'
require 'support/factory_girl'


RSpec.describe Tutorial, :type => :model do
let!(:tutorial){build(:tutorail)}

# The below is testing the name of the tutorial model.
        it "responds to a name" do
            #Does the name exist?
        expect(user).to respond_to(:first_name)
    end

        it "is invalid without a name" do
            #Can a tutorial be created without a name?
        expect(user).to be_invalid
    end

        it "raises an error without a name" do
            #Will it raise an error without a name?
        expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
end