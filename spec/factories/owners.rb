# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    first_name "Matt"
    last_name "Smith"
    email "dr.who@tardis.com"
    company "Bad Wolf"
  end
end
