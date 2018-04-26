require 'rails_helper'

describe 'Managing activites', js:true do
  specify 'I can create an Resource when not signed in' do
    user = FactoryGirl.create(:user_anon)

    visit '/'
    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Sign up'
    click_link 'Create Activity'
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Create Resource'
    expect(page).to have_content 'Resource was successfully created'
  end


  specify 'I cannot create an Resource without filling in title' do
    user = FactoryGirl.create(:user_anon)

    visit '/'
    click_link 'Create Activity'
    click_button 'New Resource'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Create Resource'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify 'I cannot create an Resource without filling in description' do
    user = FactoryGirl.create(:user_anon)

    visit '/'
    click_link 'Create Activity'
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Create Resource'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end


  specify 'I cannot create an Resource without filling in Email' do
    user = FactoryGirl.create(:user_anon)

    visit '/'
    click_link 'Create Activity'
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    click_button 'Create Resource'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify 'I can create a resource with a file as a guest' do
    user = FactoryGirl.create(:user)
    login_as(:user)
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

  specify 'I can create a resource with a file as a user' do
  
  end
end
