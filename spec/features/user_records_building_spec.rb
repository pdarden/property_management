require 'spec_helper'

feature 'Real estate associate records a building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refor back to pertinent information
} do
  # ACCEPTANCE CRITERIA
  # * I must specify a street address, city, state, and postal code
  # * Only US states can be specified
  # * I can optionally specify a description of the building
  # * If I enter all of the required information in the required format, the building is recorded.
  # * If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  # * Upon successfully creating a building, I am redirected so that I can record another building.

  scenario 'all required fields are filled' do
    @condo = FactoryGirl.build(:building)
    state = State.create(name: 'Florida', id: 1)
    visit buildings_path
    click_link 'Create Building'

    fill_in 'Street Address', with: @condo.street_address
    fill_in 'City', with: @condo.city
    select state.name, from: 'building_state_id'
    fill_in 'Zip Code', with: @condo.postal_code

    click_button 'Add Building'

    expect(page).to have_content 'Building created successfully!'
    expect(page).to have_content @condo.street_address
    expect(page).to have_content @condo.city
    expect(page).to have_content state.name
    expect(page).to have_content @condo.postal_code
    expect(page).to have_content 'Create Building'
  end

  scenario 'all required fields with description are filled' do
    @condo = FactoryGirl.build(:building)
    state = State.create(name: 'Florida', id: 1)
    visit buildings_path
    click_link 'Create Building'

    fill_in 'Street Address', with: @condo.street_address
    fill_in 'City', with: @condo.city
    select state.name, from: 'building_state_id'
    fill_in 'Zip Code', with: @condo.postal_code
    fill_in 'Description', with: @condo.description

    click_button 'Add Building'

    expect(page).to have_content 'Building created successfully!'
    expect(page).to have_content @condo.street_address
    expect(page).to have_content @condo.city
    expect(page).to have_content state.name
    expect(page).to have_content @condo.postal_code
    expect(page).to have_content @condo.description
    expect(page).to have_content 'Create Building'
  end

  scenario 'not all required fields are filled' do
    visit new_building_path
    click_button 'Add Building'

    expect(page).to have_content "can't be blank"
    current_path.should == buildings_path
  end
end
