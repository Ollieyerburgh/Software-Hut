require 'rails_helper'

describe 'Managing activites', js:true do
  specify 'I can create a resource with a file as a guest' do
    visit '/activities/new'
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Resource description', with: 'Test-Description'
    fill_in 'Email', with: 'Test@hotmail.co.uk'
    attach_file("resource_file", Rails.root + "spec/features/file.pdf")
    check 'resource_terms_of_service'
    click_button 'Create Resource'
    expect(page).to have_content 'Resource was successfully created'
  end


  specify 'I cannot create an Resource without filling in title' do

    visit '/activities/new'
    click_button 'New Resource'
    fill_in 'Resource description', with: 'Test-Description'
    fill_in 'Email', with: 'test@hotmail.com'
    check 'resource_terms_of_service'
    click_button 'Create Resource'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify 'I cannot create an Resource without filling in description' do

    visit '/activities/new'
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Email', with: 'test@hotmail.com'
    check 'resource_terms_of_service'
    click_button 'Create Resource'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end


  specify 'I cannot create an Resource without filling in Email' do
    visit '/activities/new'
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Resource description', with: 'Test-Description'
    check 'resource_terms_of_service'
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
    fill_in 'Password', with: 'foobar12'
    click_button 'Log in'
    visit '/'
    click_link 'Create Activity'
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Resource description', with: 'Test-Description'
    fill_in 'Email', with: 'Test@hotmail.co.uk'
    attach_file("resource_file", Rails.root + "spec/features/file.pdf")
    check 'resource_terms_of_service'
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
    fill_in 'Password', with: 'foobar12'
    click_button 'Log in'
    find('.dropdown-toggle').click
    click_link 'My Activities'
    expect(page).to have_content 'Test-Description'
    expect(page).to have_content 'Download'
  end

  specify 'When I like an activity, it appears in saved activities' do
    activity = FactoryGirl.create(:activity_approved)
    user = FactoryGirl.create(:user1)
    visit '/'
    click_link 'Log in'
    fill_in 'Email', with: "ollieyerburgh@test1.com"
    fill_in 'Password', with: 'foobar12'
    click_button 'Log in'
    visit '/'
    click_link 'Saved Activities'
    expect(page).to have_content 'test-title'
    find("#likes_#{activity.id}").text.should include('0')
  end

end
