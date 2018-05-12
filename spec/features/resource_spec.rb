require 'rails_helper'

describe 'Managing resources', js:true do
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

  specify 'I can create a resource with a file as a user' do
    user = FactoryGirl.create(:user)
    login_as(user)
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

  specify 'I cannot create an Resource without checking the terms of service' do
    visit '/activities/new'
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Resource description', with: 'Test-Description'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Create Resource'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "must be accepted"
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
    wait_for_ajax
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Resource description', with: 'Test-Description'
    fill_in 'Email', with: 'Test@hotmail.co.uk'
    attach_file("resource_file", Rails.root + "spec/features/file.pdf")
    check 'resource_terms_of_service'
    click_button 'Create Resource'
    wait_for_ajax
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
    wait_for_ajax
    expect(page).to have_content 'Test-Description'
    expect(page).to have_content 'Download'
  end

  specify 'I can edit my own resource as a user' do
    resource = FactoryGirl.create(:resource_approved)
    visit '/users/sign_in'
    fill_in 'Email', with: "ollieyerburgh@test1.com"
    fill_in 'Password', with: "foobar12"
    click_button 'Log in'
    wait_for_ajax
    find('.dropdown-toggle').click
    click_link 'My Activities'
    wait_for_ajax
    expect(page).to have_content "test-resource"
    click_link 'Edit'
    wait_for_ajax
    fill_in 'Resource description', with: 'resource-test'
    check 'resource_terms_of_service'
    click_button 'Update Resource'
    expect(page).to have_content 'Resource was successfully updated.'
  end

  specify 'I can delete my own resource as a user' do
    resource = FactoryGirl.create(:resource_approved)
    visit '/users/sign_in'
    fill_in 'Email', with: "ollieyerburgh@test1.com"
    fill_in 'Password', with: "foobar12"
    click_button 'Log in'
    wait_for_ajax
    visit '/'
    find('.dropdown-toggle').click
    click_link 'My Activities'
    wait_for_ajax
    expect(page).to have_content "test-resource"
    page.accept_confirm { click_link "Destroy" }
    expect(page).to have_content('Resource was successfully destroyed.')
  end

end
