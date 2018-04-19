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
end
