require 'spec_helper'

feature 'Real estate associate records owner', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners'
} do
  # ACCEPTANCE CRITERIA
  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  scenario 'fill all required fields' do
    person = FactoryGirl.build(:owner)
    visit owners_path
    click_link 'Create Owner'

    fill_in 'First Name', with: person.first_name
    fill_in 'Last Name', with: person.last_name
    fill_in 'Email', with: person.email

    click_button 'Add Owner'

    expect(page).to have_content person.first_name
    expect(page).to have_content person.last_name
    expect(page).to have_content person.email
    expect(page).to have_content 'Create Owner'
  end

  scenario 'all required fields with company name' do
    person = FactoryGirl.build(:owner)
    visit owners_path
    click_link 'Create Owner'

    fill_in 'First Name', with: person.first_name
    fill_in 'Last Name', with: person.last_name
    fill_in 'Email', with: person.email
    fill_in 'Company', with: person.company

    click_button 'Add Owner'

    expect(page).to have_content person.first_name
    expect(page).to have_content person.last_name
    expect(page).to have_content person.email
    expect(page).to have_content person.company
    expect(page).to have_content 'Create Owner'
  end

  scenario 'no required fields are filled' do
    visit new_owner_path
    click_button 'Add Owner'

    expect(page).to have_content "can't be blank"
    current_path.should == owners_path
  end
end
