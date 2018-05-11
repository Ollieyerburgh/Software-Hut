require 'rails_helper'

describe 'Users', js: true do
  specify 'I can Sign up as a user with a long password' do
    visit '/'
    expect(page).to have_content 'Sign up'
    click_link 'Sign up'
    fill_in 'Forename', with: 'Test'
    fill_in 'Surname', with: 'Test-Surname'
    fill_in 'Email', with: 'Test-Email@hotmail.com'
    fill_in 'Password', with: 'test123434'
    fill_in 'Password confirmation', with: 'test123434'
    fill_in 'Postcode', with: 'S102SQ'
    fill_in 'How did you hear about HeppSY?', with: 'test-answer'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully'
    expect(page).to_not have_content 'is too short (minimum is 8 characters)'

  end
  specify 'I can Sign up as a Learner' do
    visit '/'
    expect(page).to have_content 'Sign up'
    click_link 'Sign up'
    fill_in 'Forename', with: 'Test'
    fill_in 'Surname', with: 'Test-Surname'
    fill_in 'Email', with: 'Test-Email1@hotmail.com'
    fill_in 'Password', with: 'test123434'
    fill_in 'Password confirmation', with: 'test123434'
    fill_in 'Postcode', with: 'S102SQ'
    fill_in 'How did you hear about HeppSY?', with: 'test-answer'
    select "Learner", :from => "Role"
    fill_in 'School', with: 'School-test'
    fill_in 'Year of study', with: 'year 10'
    page.execute_script("$('#user_dob').val('01/01/2000')")
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully'
  end

  specify 'I can Sign up as a Guardian/Parent' do
    visit '/'
    expect(page).to have_content 'Sign up'
    click_link 'Sign up'
    fill_in 'Forename', with: 'Test'
    fill_in 'Surname', with: 'Test-Surname'
    fill_in 'Email', with: 'Test-Email1@hotmail.com'
    fill_in 'Password', with: 'test123434'
    fill_in 'Password confirmation', with: 'test123434'
    fill_in 'Postcode', with: 'S102SQ'
    fill_in 'How did you hear about HeppSY?', with: 'test-answer'
    select "Guardian/Parent", :from => "Role"
    fill_in 'Associated School', with: 'School-test'

    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully'
  end
  specify 'I can Sign up as a Teacher/advisor' do
    visit '/'
    expect(page).to have_content 'Sign up'
    click_link 'Sign up'
    fill_in 'Forename', with: 'Test'
    fill_in 'Surname', with: 'Test-Surname'
    fill_in 'Email', with: 'Test-Email1@hotmail.com'
    fill_in 'Password', with: 'test123434'
    fill_in 'Password confirmation', with: 'test123434'
    fill_in 'Postcode', with: 'S102SQ'
    fill_in 'How did you hear about HeppSY?', with: 'test-answer'
    select "Teacher/Advisor", :from => "Role"
    fill_in 'School', with: 'School-test'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully'
  end

  specify 'I can Sign up as a Partner' do
    visit '/'
    expect(page).to have_content 'Sign up'
    click_link 'Sign up'
    fill_in 'Forename', with: 'Test'
    fill_in 'Surname', with: 'Test-Surname'
    fill_in 'Email', with: 'Test-Email1@hotmail.com'
    fill_in 'Password', with: 'test123434'
    fill_in 'Password confirmation', with: 'test123434'
    fill_in 'Postcode', with: 'S102SQ'
    fill_in 'How did you hear about HeppSY?', with: 'test-answer'
    select "Partner", :from => "Role"
    fill_in 'Organisation', with: 'School-test'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully'
  end

  specify 'I cannot Sign up as a user with a short password' do
    visit '/'
    expect(page).to have_content 'Sign up'
    click_link 'Sign up'
    fill_in 'Forename', with: 'Test'
    fill_in 'Surname', with: 'Test-Surname'
    fill_in 'Email', with: 'Test-Email@hotmail.com'
    fill_in 'Password', with: 'test123'
    fill_in 'Password confirmation', with: 'test123'
    fill_in 'Postcode', with: 'S102SQ'
    fill_in 'How did you hear about HeppSY?', with: 'test-answer'

    click_button 'Sign up'
    expect(page).to_not have_content 'Welcome! You have signed up successfully'
    expect(page).to have_content 'is too short (minimum is 8 characters)'

  end

  specify "My account is locked if I enter my password wrong too many times" do
      visit "/users/sign_in"
      user = FactoryGirl.create(:user)
      20.times do
        fill_in "Email", with: user.email
        fill_in "Password", with: 'notmypassword'
        click_button 'Log in'
      end
      expect(page).to have_content 'Your account is locked.'
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
    fill_in "Password", with: "foobar12"
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
    fill_in 'Password', with: 'test1234'
    fill_in 'Password confirmation', with: 'test1234'
    fill_in 'Postcode', with: 'S102SQ'
    fill_in 'How did you hear about HeppSY?', with: 'test-answer'

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
    fill_in 'Password', with: 'test1234'
    fill_in 'Password confirmation', with: 'test1234'
    fill_in 'Postcode', with: 'S102SQ'
    fill_in 'How did you hear about HeppSY?', with: 'test-answer'

    click_button 'Sign up'
    expect(page).to have_content 'Hello, Test!'
    click_link 'Hello, Test!'
    click_link 'Log out'
    click_link 'Sign up'
    fill_in 'Forename', with: 'Test'
    fill_in 'Surname', with: 'Test-Surname'
    fill_in 'Email', with: 'Test-Email@hotmail.com'
    fill_in 'Password', with: 'test1234'
    fill_in 'Password confirmation', with: 'test1234'
    fill_in 'Postcode', with: 'S102SQ'
    fill_in 'How did you hear about HeppSY?', with: 'test-answer'

    click_button 'Sign up'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content 'Email has already been taken'

  end

  specify 'I can login as a user' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test.com"
    fill_in "Password", with: "foobar12"
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end

  specify 'I cannot login with a invalid password' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test1.com"
    fill_in "Password", with: "foobar12"
    click_button "Log in"
    expect(page).to have_content "Invalid Email or password."
  end

  specify 'I can add a preference and receive an email containing activities that fit' do
    user = FactoryGirl.create(:user)
    age = FactoryGirl.create(:age)
    theme = FactoryGirl.create(:theme)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test.com"
    fill_in "Password", with: "foobar12"
    click_button "Log in"
    find('.dropdown-toggle').click
    save_and_open_page
    click_link 'My Preferences'
    click_link 'New Preference'
    select "9-11", :from => "Ages"
    select "theme", :from => "Themes"
    click_button "Create Preference"
    expect(page).to have_content "Preference was successfully created"
    ActionMailer::Base.deliveries.last.to.should include("ollieyerburgh@test.com")




  end

  specify 'I can like an activity, which changes like count' do
    activity = FactoryGirl.create(:activity_approved)
    user = FactoryGirl.create(:user1)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test1.com"
    fill_in "Password", with: "foobar12"
    click_button "Log in"
    visit '/activities'
    expect(page).to have_css("#likes_1", text: "0")
    Capybara.page.find('#like_1').click
    wait_for_ajax
    visit '/activities'
    sleep(5)
    expect(page).to have_css("#likes_1", text: "1")
  end

  specify 'Users who liked an event receive cancellation email' do
    activity = FactoryGirl.create(:activity_approved)
    user = FactoryGirl.create(:user1)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test1.com"
    fill_in "Password", with: "foobar12"
    click_button "Log in"
    visit '/activities'
    Capybara.page.find('.like-btn').click
    find('.dropdown-toggle').click
    click_link "Log out"
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test.com"
    fill_in "Password", with: "foobar12"
    click_button "Log in"
    visit '/activities'
    page.accept_confirm { click_link "Destroy" }
    ActionMailer::Base.deliveries.last.to.should include("ollieyerburgh@test1.com")
  end
end
