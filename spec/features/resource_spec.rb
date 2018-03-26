require 'rails_helper'

describe 'Managing activites' do
  specify 'I can create an activity when not signed in' do
    visit '/'
    expect(page).to have_content 'Sign in'
    expect(page).to have_content 'Register'
    # expect(page.not_to have_content 'Saved Activities')
    click_link 'Create Activity'
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Create Resource'
    expect(page).to have_content 'Resource was successfully created'
    #expect(page).to have_content 'Title: Test-title'
    #expect(page).to have_content 'Description: Test-description'
    # Enable JS

  end
end
