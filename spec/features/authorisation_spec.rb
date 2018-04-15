require 'rails_helper'

describe 'Authorisation', js: true do
  specify 'I can create an activity when not signed in' do
    visit '/'
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Start Date', with: '01/02/2003'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Create Activity'
    expect(page).to have_content 'Activity was successfully created'
    #expect(page).to have_content 'Title: Test-title'
    #expect(page).to have_content 'Description: Test-description'
    #expect(page).to have_content 'Startdate: 01/02/03'
    #expect(page).to have_content 'Enddate: 01/02/2004'
    #expect(page).to have_content 'Url: www.facebook.com'
    # Enable JS

  end
  specify 
end
