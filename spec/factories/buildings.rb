# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    street_address "MyString"
    city "MyString"
    state_id 1
    postal_code "MyString"
    description "MyText"
    owner_id 1
  end
end
