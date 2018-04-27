require 'rails_helper'

describe 'Admin features', js: true do

  specify 'As an admin I can approve an activity request from a guest' do
    admin = FactoryGirl.create(:admin)
    visit '/'
    click_link "Create Activity"
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Start Date', with: '01/02/2003'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    check 'activity_terms_of_service'
    click_button 'Create Activity'
    login_as(admin)
    visit '/admin/requests/show'
    visit '/admin'
    click_link 'Manage requests'
    expect(page).to have_content 'Approve'
    expect(page).to have_content 'Reject'
    expect(page).to have_content 'Test-title'
    click_link 'Approve'
    ActionMailer::Base.deliveries.last.to.should include("test@hotmail.com")
  end

  specify 'As an admin I can approve an activity request from a user' do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user1)
    login_as(user)
    visit '/'
    click_link "Create Activity"
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Start Date', with: '01/02/2003'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'UserTest@user.com'
    check 'activity_terms_of_service'

    click_button 'Create Activity'
    login_as(admin)
    visit '/admin/requests/show'
    visit '/admin'
    click_link 'Manage requests'
    expect(page).to have_content 'Approve'
    expect(page).to have_content 'Reject'
    expect(page).to have_content 'Test-title'
    click_link 'Approve'
    ActionMailer::Base.deliveries.last.to.should include("UserTest@user.com")
  end

  specify 'As an admin I can reject an activity request from a guest' do
    admin = FactoryGirl.create(:admin)
    visit '/'
    click_link "Create Activity"
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Start Date', with: '01/02/2003'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'GuestReject@test.com'
    check 'activity_terms_of_service'
    click_button 'Create Activity'
    login_as(admin)
    visit '/admin/requests/show'
    visit '/admin'
    click_link 'Manage requests'
    expect(page).to have_content 'Approve'
    expect(page).to have_content 'Reject'
    expect(page).to have_content 'Test-title'
    click_link 'Reject'
    fill_in 'Message', with: 'Rejected'
    click_button 'Submit'
    expect(page).to have_content 'Rejection email was sent'
    expect(page).to have_content 'Pending activities'
    ActionMailer::Base.deliveries.last.to.should include("GuestReject@test.com")

  end

  specify 'As an admin I can reject an activity request from a user' do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user1)
    login_as(user)
    visit '/'
    click_link "Create Activity"
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Start Date', with: '01/02/2003'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'UserReject@test.com'
    check 'activity_terms_of_service'
    click_button 'Create Activity'
    login_as(admin)
    visit '/admin/requests/show'
    visit '/admin'
    click_link 'Manage requests'
    expect(page).to have_content 'Approve'
    expect(page).to have_content 'Reject'
    expect(page).to have_content 'Test-title'
    click_link 'Reject'
    fill_in 'Message', with: 'Rejected'
    click_button 'Submit'
    expect(page).to have_content 'Rejection email was sent'
    expect(page).to have_content 'Pending activities'
    ActionMailer::Base.deliveries.last.to.should include("UserReject@test.com")

  end

  specify 'As an admin I can edit a user' do
    user = FactoryGirl.create(:user)
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/admin/users/show'
    expect(page).to have_content user.email
    expect(page).to have_content user.forename

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
    expect(page).to have_content user.email
    expect(page).to have_content user.forename
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

  specify 'As an admin, I should be able to edit my password and email' do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/'
    find('.dropdown-toggle').click
    click_link 'Account'
    fill_in 'Password', with: 'password1'
    fill_in 'Password confirmation', with: 'password1'
    fill_in 'Current password', with: 'test12'
    click_button 'Update'
    expect(page).to have_content 'Your account has been updated successfully'
  end

=begin
  specify 'As an admin I can approve a resource request, which sends an email' do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit "/admin/users/show"
    resource = FactoryGirl.create(:resource)
    visit "/admin/requests/show"
    expect(current_path).to eq("/admin/requests/show")
    save_and_open_page
    expect(page).to have_content 'Approve'
    expect(page).to have_content 'Reject'
    expect(page).to have_content 'test-title'
    click_link 'Approve'

    save_and_open_page
    expect(page).to_not have_content 'Approve'

  end
=end
=begin

=end
end
