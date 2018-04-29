require 'rails_helper'

describe 'User registration', js: true do
  specify 'I can Sign up as a user' do
    visit '/'
    expect(page).to have_content 'Sign up'
    click_link 'Sign up'
    fill_in 'Forename', with: 'Test'
    fill_in 'Surname', with: 'Test-Surname'
    fill_in 'Email', with: 'Test-Email@hotmail.com'
    fill_in 'Password', with: 'test12'
    fill_in 'Password confirmation', with: 'test12'
    fill_in 'Postcode', with: 'S102SQ'
    click_button 'Sign up'
    expect(page).to have_content 'Hello, Test!'
    click_link 'Hello, Test!'
    click_link 'Log out'
  end

  specify 'I can click forgotton password, which will email me a link to new' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Log in'
    click_link 'Forgot your password?'
    fill_in 'user_email', with: 'ollieyerburgh@test.com'
    fill_in 'Email', with: 'ollieyerburgh@test.com'
    click_button 'Send me reset password instructions'
    expect(page).to have_content 'You will receive an email with instructions on how to reset your password in a few minutes.'
    ActionMailer::Base.deliveries.last.to.should include("ollieyerburgh@test.com")

  end

  specify 'I can cancel my account, which will delete all my activities' do
    activity = FactoryGirl.create(:activity_approved)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test.com"
    fill_in "Password", with: "foobar"
    click_button "Log in"
    visit '/'
    expect(page).to have_content 'test-title'
    find('.dropdown-toggle').click
    click_link 'Account'
    page.accept_confirm { click_link "Cancel my account" }
    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon"
    visit '/'
    expect(page).to_not have_content 'test-title'
  end

  specify 'Required works for registration' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Surname', with: 'Test-Surname'
    fill_in 'Email', with: 'Test-Email@hotmail.com'
    fill_in 'Password', with: 'test12'
    fill_in 'Password confirmation', with: 'test12'
    fill_in 'Postcode', with: 'S102SQ'
    click_button 'Sign up'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
   end


  specify 'I cannot Sign up with already taken email' do
    visit '/'
    expect(page).to have_content 'Sign up'
    click_link 'Sign up'
    fill_in 'Forename', with: 'Test'
    fill_in 'Surname', with: 'Test-Surname'
    fill_in 'Email', with: 'Test-Email@hotmail.com'
    fill_in 'Password', with: 'test12'
    fill_in 'Password confirmation', with: 'test12'
    fill_in 'Postcode', with: 'S102SQ'
    click_button 'Sign up'
    expect(page).to have_content 'Hello, Test!'
    click_link 'Hello, Test!'
    click_link 'Log out'
    click_link 'Sign up'
    fill_in 'Forename', with: 'Test'
    fill_in 'Surname', with: 'Test-Surname'
    fill_in 'Email', with: 'Test-Email@hotmail.com'
    fill_in 'Password', with: 'test12'
    fill_in 'Password confirmation', with: 'test12'
    fill_in 'Postcode', with: 'S102SQ'
    click_button 'Sign up'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content 'Email has already been taken'

  end

  specify 'I can like an activity, which changes like count' do
    activity = FactoryGirl.create(:activity_approved)
    puts activity.id
    user = FactoryGirl.create(:user1)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test1.com"
    fill_in "Password", with: "foobar"
    click_button "Log in"
    visit '/activities'
    expect(page).to have_css("#likes_1", text: "0")
    Capybara.page.find('.like-btn').click
    visit '/activities'
    expect(page).to have_css("#likes_1", text: "1")
  end

  specify 'Users who liked an event receive cancellation email' do
    activity = FactoryGirl.create(:activity_approved)
    puts activity.id
    user = FactoryGirl.create(:user1)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test1.com"
    fill_in "Password", with: "foobar"
    click_button "Log in"
    visit '/activities'
    Capybara.page.find('.like-btn').click
    find('.dropdown-toggle').click
    click_link "Log out"
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test.com"
    fill_in "Password", with: "foobar"
    click_button "Log in"
    visit '/activities'
    page.accept_confirm { click_link "Destroy" }
    ActionMailer::Base.deliveries.last.to.should include("ollieyerburgh@test1.com")
  end
end
