FactoryGirl.define do

    # We define a factory name, and then we specify the class
    factory :tutorial, class: Tutorial do
    # These set up the attributes, each declaration is a method call.
    name "Tame the Imagine Dragon"
    description "How to Tame your Imagine Dragons"
    category    "Keyboards"
    picture     "  "
  end

  factory :nameless_tutorial, class: Tutorial do
    # These set up the attributes, each declaration is a method call.
    name ""
    description "How to Tame your Imagine Dragons"
    category    "Keyboards"
    picture     "  "
  end

end

