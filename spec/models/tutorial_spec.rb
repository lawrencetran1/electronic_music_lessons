require 'rails_helper'
require 'support/factory_girl'


RSpec.describe Tutorial, :type => :model do
let!(:tutorial){build(:tutorial)}
let!(:nameless_tutorial){build(:nameless_tutorial)}
let!(:no_description){build(:no_description)}

# The below is testing the name of the tutorial model.
        it "responds to a name" do
            #Does the name exist?
        expect(subject).to respond_to(:name)
    end

        it "is invalid without a name" do
            #Can a tutorial be created without a name?
        expect(nameless_tutorial).to be_invalid
    end

        it "raises an error without a name" do
            #Will it raise an error without a name?
        expect{nameless_tutorial.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

# The below is testing the description of the tutorial model.
        it "responds to a description" do
            #Does the description exist?
        expect(subject).to respond_to(:description)
    end

        it "is invalid without a description" do
            #Can a tutorial be created without a description?
        expect(no_description).to be_invalid
    end

        it "raises an error without a description" do
            #Will it raise an error without a description?
        expect{no_description.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end


end


    # t.string   "name"
    # t.string   "description"
    # t.string   "category"
    # t.string   "picture"