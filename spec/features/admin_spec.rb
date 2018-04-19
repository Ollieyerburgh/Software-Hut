require 'rails_helper'

describe 'Admin features', js: true do
  specify 'As an admin I can edit a user' do
    user = FactoryGirl.create(:user)
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/admin/users/show'
    expect(page).to have_content "test@test.com"
    expect(page).to have_content "test"

    click_link 'Edit'
    fill_in 'Forename', with: "updatedName"
    fill_in 'Email', with: "updated@test.com"
    click_button 'Update'
    expect(page).to have_content "User was successfully updated."
    expect(page).to have_content "updated@test.com"
    expect(page).to have_content "updatedName"
  end

  specify 'As an admin I can delete a user ' do
    user = FactoryGirl.create(:user)
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/admin/users/show'
    expect(page).to have_content "test@test.com"
    expect(page).to have_content "test"
    click_link 'Delete'
    expect(page).to have_content "User was successfully destroyed"
    expect(page).to_not have_content "test@test.com"


  end

  specify 'As an admin I can create an admin' do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/admin'
    click_link 'register'
    fill_in 'Email', with: 'admin2@admin2.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Create Admin'

    expect(page).to have_content 'Admin added'
    visit '/admin/users/show'
    expect(page).to have_content 'admin2@admin2.com'

  end

  specify 'As an admin I can approve an activity request' do
    user = FactoryGirl.create(:user)
    admin = FactoryGirl.create(:admin)

    activity = FactoryGirl.create(:activity)
    login_as(admin)
    visit '/admin/users/show'

    visit '/admin'
    click_link 'requests'
    expect(page).to have_content 'Approve'
    expect(page).to have_content 'Reject'
    expect(page).to have_content 'test-title'
    click_link 'Approve'
    expect(page).to_not have_content 'Approve'


  end

  specify 'As an admin I can approve a resource request' do
    user = FactoryGirl.create(:user)
    admin = FactoryGirl.create(:admin)
    resource = FactoryGirl.create(:resource)
    login_as(admin)
    visit '/admin/users/show'

    visit '/admin'
    click_link 'requests'
    save_and_open_page
    expect(page).to have_content 'Approve'
    expect(page).to have_content 'Reject'
    expect(page).to have_content 'test-title'
    click_link 'Approve'
    save_and_open_page
    expect(page).to_not have_content 'Approve'

  end

=begin
  specify 'As an admin I can reject an activity request' do
    user = FactoryGirl.create(:user)
    admin = FactoryGirl.create(:admin)

    activity = FactoryGirl.create(:activity)
    login_as(admin)
    visit '/admin/users/show'
    visit '/admin'
    click_link 'requests'
    expect(page).to have_content 'Approve'
    expect(page).to have_content 'Reject'
    expect(page).to have_content 'test-title'
    click_link 'Reject'
    save_and_open_page
    fill_in 'Message', with: 'Rejected'
    click_button 'Send Message'
    save_and_open_page
    expect(page).to have_content 'Rejected email sent'
    save_and_open_page
    expect(page).to have_content 'Pending requests'
  end
=end
end
