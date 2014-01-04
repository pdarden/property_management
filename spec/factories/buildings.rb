# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    street_address "1 No Way"
    city "Miami"
    state_id 1
    postal_code "11011"
    description "This building is not well kept."
    owner_id 1
  end
end
