require 'rails_helper'

describe 'Admin features', js: true do

  specify 'As an admin I can approve an activity request from a guest' do
    admin = FactoryGirl.create(:admin)
    visit '/'
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Continue'
    click_button 'Continue'
    page.execute_script("$('#activity_start_date').val('01/01/2008')")
    page.execute_script("$('#activity_end_date').val('01/01/2009')")
    page.execute_script("$('#activity_deadline').val('01/01/2010')")
    check 'activity_terms_of_service'
    click_button 'Continue'
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
    visit '/activities/new'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'UserTest@user.com'
    click_button 'Continue'
    click_button 'Continue'
    page.execute_script("$('#activity_start_date').val('01/01/2008')")
    page.execute_script("$('#activity_end_date').val('01/01/2009')")
    page.execute_script("$('#activity_deadline').val('01/01/2010')")
    check 'activity_terms_of_service'
    click_button 'Continue'
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
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'GuestReject@test.com'
    click_button 'Continue'
    click_button 'Continue'
    page.execute_script("$('#activity_start_date').val('01/01/2008')")
    page.execute_script("$('#activity_end_date').val('01/01/2009')")
    page.execute_script("$('#activity_deadline').val('01/01/2010')")
    check 'activity_terms_of_service'
    click_button 'Continue'
    expect(page).to have_content ("Activity was successfully created")
    login_as(admin)
    visit '/admin/requests/show'
    expect(page).to have_content 'Approve'
    expect(page).to have_content 'Request changes'
    expect(page).to have_content 'Test-title'
    click_link 'Request changes'
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
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'UserReject@test.com'
    click_button 'Continue'
    click_button 'Continue'
    page.execute_script("$('#activity_start_date').val('01/01/2008')")
    page.execute_script("$('#activity_end_date').val('01/01/2009')")
    page.execute_script("$('#activity_deadline').val('01/01/2010')")
    check 'activity_terms_of_service'
    click_button 'Continue'
    login_as(admin)
    visit '/admin/requests/show'
    visit '/admin'
    click_link 'Manage requests'
    expect(page).to have_content 'Approve'
    expect(page).to have_content 'Request changes'
    expect(page).to have_content 'Test-title'
    click_link 'Request changes'
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
    save_and_open_page
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
    click_link 'Admin Invite'
    fill_in 'Email', with: 'admin2@admin2.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
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
    fill_in 'Current password', with: 'test1234'
    click_button 'Update'
    expect(page).to have_content 'Your account has been updated successfully'
  end

  specify 'As an admin, I should be able to create an activity' do
    admin = FactoryGirl.create(:admin)
    visit '/admins/sign_in'
    fill_in 'Email', with: 'admin@admin.com'
    fill_in 'Password', with: 'test1234'
    click_link 'Log in'
    visit '/'
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Continue'
    click_button 'Continue'
    page.execute_script("$('#activity_start_date').val('01/01/2008')")
    page.execute_script("$('#activity_end_date').val('01/01/2009')")
    page.execute_script("$('#activity_deadline').val('01/01/2010')")
    check 'activity_terms_of_service'
    click_button 'Continue'
    expect(page).to have_content "Activity was successfully created"
  end
  specify 'As an admin, I should be able to create a resource' do
    admin = FactoryGirl.create(:admin)
    visit '/admins/sign_in'
    fill_in 'Email', with: 'admin@admin.com'
    fill_in 'Password', with: 'test1234'
    click_link 'Log in'
    visit '/'
    click_link 'Create Activity'
    click_button 'New Resource'
    fill_in 'Title', with: 'Test-admin'
    fill_in 'Resource description', with: 'Test-Desc'
    fill_in 'Email', with: 'test@testadmin.com'
    check 'resource_terms_of_service'
    click_button 'Create Resource'
    expect(page).to have_content "Resource was successfully created."
  end

  context 'Preferences' do
    specify 'As an admin, I should be able to add a Subject from dashboard' do
      admin = FactoryGirl.create(:admin)
      login_as(admin)
      visit '/admin/preferences/index'
      expect(page).to_not have_content 'test-subject'
      click_link 'New Subject'
      fill_in 'Name', with: 'test-subject'
      click_button 'Create Subject'
      expect(page).to have_content 'Subject was created.'
      visit '/admin/preferences/index'
      expect(page).to have_content 'test-subject'
    end

    specify 'As an admin, I can delete a subject' do
      admin = FactoryGirl.create(:admin)
      login_as(admin)
      visit '/admin/preferences/index'
      click_link 'New Subject'
      fill_in 'Name', with: 'test-subject'
      click_button 'Create Subject'
      visit '/admin/preferences/index'
      sleep 1
      page.accept_confirm { click_link "Destroy" }
      expect(page).to have_content 'Subject was successfully destroyed.'
    end

    specify 'As an admin, I can edit a subject' do
      admin = FactoryGirl.create(:admin)
      login_as(admin)
      visit '/admin/preferences/index'
      click_link 'New Subject'
      fill_in 'Name', with: 'test-subject'
      click_button 'Create Subject'
      sleep 1
      visit '/admin/preferences/index'
      click_link 'Edit'
      fill_in 'Name', with: 'txt-pref'
      click_button 'Update Subject'
      expect(page).to have_content 'Subject was successfully updated.'
    end
    specify 'As an admin, I should be able to add a Theme from dashboard' do
      admin = FactoryGirl.create(:admin)
      login_as(admin)
      visit '/admin/preferences/index'
      expect(page).to_not have_content 'test-theme'
      click_link 'New Theme'
      fill_in 'Name', with: 'test-theme'
      click_button 'Create Theme'
      expect(page).to have_content 'Theme was successfully created.'
      visit '/admin/preferences/index'
      expect(page).to have_content 'test-theme'
    end

    specify 'As an admin, I can delete a theme' do
      admin = FactoryGirl.create(:admin)
      login_as(admin)
      visit '/admin/preferences/index'
      click_link 'New Theme'
      fill_in 'Name', with: 'test-theme'
      click_button 'Create Theme'
      visit '/admin/preferences/index'
      sleep 1
      page.accept_confirm { click_link "Destroy" }
      expect(page).to have_content 'Theme was successfully destroyed.'
    end

    specify 'As an admin, I can edit a theme' do
      admin = FactoryGirl.create(:admin)
      login_as(admin)
      visit '/admin/preferences/index'
      click_link 'New Theme'
      fill_in 'Name', with: 'test-theme'
      click_button 'Create Theme'
      sleep 1
      visit '/admin/preferences/index'
      click_link 'Edit'
      fill_in 'Name', with: 'txt-pref'
      click_button 'Update Theme'
      expect(page).to have_content 'Theme was successfully updated.'
    end

    specify 'As an admin, I should be able to add a Delivery method from dashboard' do
      admin = FactoryGirl.create(:admin)
      login_as(admin)
      visit '/admin/preferences/index'
      expect(page).to_not have_content 'test-delivery'
      click_link 'New delivery method'
      fill_in 'Method', with: 'test-delivery'
      click_button 'Create Delivery'
      expect(page).to have_content 'Delivery was successfully created'
      visit '/admin/preferences/index'
      expect(page).to have_content 'test-delivery'
    end

    specify 'As an admin, I can delete a delivery method' do
      admin = FactoryGirl.create(:admin)
      login_as(admin)
      visit '/admin/preferences/index'
      click_link 'New delivery method'
      fill_in 'Method', with: 'test-delivery'
      click_button 'Create Delivery'
      visit '/admin/preferences/index'
      sleep 1
      page.accept_confirm { click_link "Destroy" }
      expect(page).to have_content 'Delivery was successfully destroyed.'
    end

    specify 'As an admin, I can edit a delivery method' do
      admin = FactoryGirl.create(:admin)
      login_as(admin)
      visit '/admin/preferences/index'
      click_link 'New delivery method'
      fill_in 'Method', with: 'test-delivery'
      click_button 'Create Delivery'
      sleep 1
      visit '/admin/preferences/index'
      click_link 'Edit'
      fill_in 'Method', with: 'txt-pref'
      click_button 'Update Delivery'
      expect(page).to have_content 'Delivery was successfully updated.'
    end

    specify 'As an admin, I should be able to add an age preference from dashboard' do
      admin = FactoryGirl.create(:admin)
      login_as(admin)
      visit '/admin/preferences/index'
      expect(page).to_not have_content '90-100'
      click_link 'New age'
      fill_in 'Age', with: '90-100'
      click_button 'Create Age'
      expect(page).to have_content 'Age was successfully created'
      visit '/admin/preferences/index'
      expect(page).to have_content '90-100'
    end

    specify 'As an admin, I should be able to edit age preference from dashboard' do
      admin = FactoryGirl.create(:admin)
      login_as(admin)
      visit '/admin/preferences/index'
      click_link 'New age'
      fill_in 'Age', with: '90-100'
      click_button 'Create Age'
      visit '/admin/preferences/index'
      click_link 'Edit'
      fill_in 'Age', with: '900'
      click_button 'Update Age'
      expect(page).to have_content 'Age was successfully updated'
      visit '/admin/preferences/index'
      expect(page).to_not have_content '90-100'
      expect(page).to have_content '900'
    end

    specify 'As an admin, I should be able to delete an age preference from dashboard' do
      admin = FactoryGirl.create(:admin)
      login_as(admin)
      visit '/admin/preferences/index'
      click_link 'New age'
      fill_in 'Age', with: '90-100'
      click_button 'Create Age'
      visit '/admin/preferences/index'
      page.accept_confirm { click_link "Destroy" }
      expect(page).to have_content 'Age was successfully destroyed'
    end

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
