require 'rails_helper'

describe 'Managing activites', js:true do
  specify 'I can create a resource with a file as a guest' do
    visit '/'
    click_link 'Create Activity'
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Email', with: 'Test@hotmail.co.uk'
    attach_file("files", Rails.root + "spec/features/file.pdf")
    click_button 'Create Resource'
    expect(page).to have_content 'Resource was successfully created'
  end


  specify 'I cannot create an Resource without filling in title' do

    visit '/'
    click_link 'Create Activity'
    click_button 'New Resource'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Email', with: 'test@hotmail.com'
    attach_file("files", Rails.root + "spec/features/file.pdf")
    click_button 'Create Resource'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify 'I cannot create an Resource without filling in description' do

    visit '/'
    click_link 'Create Activity'
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Email', with: 'test@hotmail.com'
    attach_file("files", Rails.root + "spec/features/file.pdf")
    click_button 'Create Resource'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end


  specify 'I cannot create an Resource without filling in Email' do
    visit '/'
    click_link 'Create Activity'
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    attach_file("files", Rails.root + "spec/features/file.pdf")
    click_button 'Create Resource'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end



  specify 'I can create a resource with a file as a user, which appears after approval' do
    user = FactoryGirl.create(:user1)
    admin = FactoryGirl.create(:admin)
    visit '/'
    click_link 'Log in'
    fill_in 'Email', with: "ollieyerburgh@test1.com"
    fill_in 'Password', with: 'foobar'
    click_button 'Log in'
    visit '/'
    click_link 'Create Activity'
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Email', with: 'Test@hotmail.co.uk'
    click_button 'Create Resource'
    expect(page).to have_content 'Resource was successfully created'
    find('.dropdown-toggle').click
    click_link 'Log out'
    login_as(admin)
    visit '/admin/requests/show'
    expect(page).to have_content('Test-Description')
    click_link 'Approve'
    find('.dropdown-toggle').click
    click_link 'Log out'
    click_link 'Log in'
    fill_in 'Email', with: "ollieyerburgh@test1.com"
    fill_in 'Password', with: 'foobar'
    click_button 'Log in'
    find('.dropdown-toggle').click
    click_link 'My Activities'
    expect(page).to have_content 'Test-Description'


  end
end
