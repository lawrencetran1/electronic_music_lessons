# Note: Factory Girl Expects that each class inherits from ActiveRecord
# All of our factory declarations get wrapped in a FactoryGirl.define block
FactoryGirl.define do

    # Describing a nameless user. The factory name needs to be descriptive.
    factory :nameless_user, class: User do
        first_name ""
        last_name ""
        email ""
        password_digest ""
    end

    # We define a factory name, and then we specify the class.
    # So below we are defining a user (factory name) with a class of User.
    factory :user, class: User do
    # These set up the attributes, each declaration is a method call.
    first_name "John"
    last_name  "Doe"
    email       "johndoe@gmail.com "
    password_digest "johndoe"
  end
end

# The below is info from the schema that needed to be added for the method to call.
    # t.string   "provider"
    # t.string   "name"
    # t.string   "first_name"
    # t.string   "last_name"
    # t.string   "image"
    # t.string   "email"
    # t.string   "password_digest"
    # t.string   "oauth_token"
    # t.datetime "oauth_expires_at"