require 'spec_helper'

feature 'User associates owner to building', %Q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do
  # ACCEPTANCE CRITERIA
  # * When recording a building, I want to optionally associate the building with its rightful owner.
  # * If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  scenario 'add owner to a building' do
    state = State.create(name: 'New York', id: 1 )
    condo = FactoryGirl.build(:building, state_id: state.id, owner_id: 21)
    visit new_building_path

    fill_in 'Street Address', with: condo.street_address
    fill_in 'City', with: condo.city
    select state.name, from: 'building_state_id'
    fill_in 'Zip Code', with: condo.postal_code
    select "Matt Smith", from: 'building_owner_id'

    expect(page).to have_content "Can't find owner? Add Owner"

    click_button 'Add Building'

    expect(page).to have_content condo.street_address
    expect(page).to have_content "Matt Smith"

    visit owners_path
    expect(page).to have_content "Matt"
    click_link 'Delete'

    expect(page).to have_content 'Owner was successfully deleted!'

    visit buildings_path
    expect(page).to have_content condo.street_address
    expect(page).to_not have_content "Matt Smith"
  end
end
