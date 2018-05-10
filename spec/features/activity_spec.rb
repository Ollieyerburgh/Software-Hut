require 'rails_helper'

describe 'Managing activites', js: true do

  specify 'I can create an activity as a guest' do
    visit '/activities/new'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Continue'
    click_button 'Continue'
    page.execute_script("$('#activity_start_date').val('01/01/2008')")
    page.execute_script("$('#activity_end_date').val('01/01/2008')")
    page.execute_script("$('#activity_deadline').val('01/01/2008')")
    check 'activity_terms_of_service'
    click_button 'Continue'
    expect(page).to have_content 'Activity was successfully created'
  end

  specify 'I can create an activity as a user' do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit '/activities/new'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Continue'
    click_button 'Continue'
    page.execute_script("$('#activity_start_date').val('01/01/2008')")
    page.execute_script("$('#activity_end_date').val('01/01/2008')")
    page.execute_script("$('#activity_deadline').val('01/01/2008')")
    check 'activity_terms_of_service'
    click_button 'Continue'
    expect(page).to have_content 'Activity was successfully created'
  end

  specify 'I cannot create an activity without filling in Title' do
    visit '/activities/new'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Continue'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify 'I cannot create an activity without filling in description' do
    visit '/activities/new'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Continue'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify 'I cannot create an activity without filling in Start Date' do
    visit '/activities/new'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Continue'
    click_button 'Continue'
    page.execute_script("$('#activity_end_date').val('01/01/2008')")
    page.execute_script("$('#activity_deadline').val('01/01/2008')")
    check 'activity_terms_of_service'
    click_button 'Continue'
    expect(page).to have_content 'Please review the problems below:'
  end

  specify 'I cannot create an activity without filling in End Date' do
    visit '/activities/new'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Continue'
    click_button 'Continue'
    page.execute_script("$('#activity_start_date').val('01/01/2008')")
    page.execute_script("$('#activity_deadline').val('01/01/2008')")
    check 'activity_terms_of_service'
    click_button 'Continue'
    expect(page).to have_content 'Please review the problems below:'
  end

  specify 'I cannot create an activity without filling in Deadline Date' do
    visit '/activities/new'

    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Continue'
    click_button 'Continue'
    page.execute_script("$('#activity_end_date').val('01/01/2008')")
    page.execute_script("$('#activity_start_date').val('01/01/2008')")
    check 'activity_terms_of_service'
    click_button 'Continue'
    expect(page).to have_content 'Please review the problems below:'
  end

  specify 'I cannot create an activity without filling in Web Address ' do
    visit '/activities/new'

    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Continue'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify 'I cannot create an activity without filling in postcode' do
    visit '/activities/new'

    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Continue'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify 'I cannot create an activity without filling in Email ' do
    visit '/activities/new'

    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    click_button 'Continue'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify 'I cannot create an activity as a user without checking the box' do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit '/activities/new'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Continue'
    click_button 'Continue'
    page.execute_script("$('#activity_start_date').val('01/01/2008')")
    page.execute_script("$('#activity_end_date').val('01/01/2008')")
    page.execute_script("$('#activity_deadline').val('01/01/2008')")
    click_button 'Continue'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "must be accepted"
  end


  specify 'I cannot create an activity without filling in Email in the valid format ' do
    visit '/activities/new'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'testhotmail.com'
    click_button 'Continue'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "Invalid email address"
  end

  specify 'I cannot create an activity without filling in Postcode in the valid format ' do
    visit '/activities/new'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: '-G1@1L88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Continue'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "Invalid postcode format"
  end

  specify 'I can edit an event that I have made' do
    activity = FactoryGirl.create(:activity_approved)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test.com"
    fill_in "Password", with: "foobar12"
    click_button "Log in"
    click_link "Saved Activities"
    click_link "Edit"
    expect(page).to have_content "test"
    fill_in "Activity description", with: 'HelloTestViewer'
    check 'activity_terms_of_service'
    click_button "Update Activity"
    expect(page).to have_content "Activity was successfully updated"
    expect(page).to have_content "HelloTestViewer"
  end

  specify 'I can delete an event that I have made' do
    activity = FactoryGirl.create(:activity_approved)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test.com"
    fill_in "Password", with: "foobar12"
    click_button "Log in"
    click_link "Saved Activities"
    page.accept_confirm { click_link "Destroy" }
    expect(page).to have_content "Activity was successfully destroyed."
  end

  specify 'I cannot edit an event that I havnt made' do
    activity = FactoryGirl.create(:activity_approved)
    user = FactoryGirl.create(:user1)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test1.com"
    fill_in "Password", with: "foobar12"
    click_button "Log in"
    visit '/activities'
    expect(page).to have_content "test"
    expect(page).to_not have_content "Edit"
  end

  specify 'I cannot delete an event that I havnt made' do
    activity = FactoryGirl.create(:activity_approved)
    user = FactoryGirl.create(:user1)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test1.com"
    fill_in "Password", with: "foobar12"
    click_button "Log in"
    visit '/activities'
    expect(page).to have_content "test"
    expect(page).to_not have_content "Destroy"
  end

  specify 'As a user, I can see approved guest activities' do
    visit '/activities/new'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    click_button 'Continue'
    click_button 'Continue'
    page.execute_script("$('#activity_start_date').val('01/01/2008')")
    page.execute_script("$('#activity_end_date').val('01/05/2010')")
    page.execute_script("$('#activity_deadline').val('02/10/2012')")
    check 'activity_terms_of_service'
    click_button 'Continue'
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/admin/requests/show'
    click_link 'Approve'
    find('.dropdown-toggle').click
    click_link 'Log out'
    user = FactoryGirl.create(:user)
    login_as(user)
    visit '/activities'
    expect(page).to have_content 'Test-Description'

  end

  specify 'I can search for an event, and like it so that it appears in my saved activities' do
  end

  specify 'I can like an event, which will increase like count by one' do
    activity = FactoryGirl.create(:activity_approved)
    user = FactoryGirl.create(:user1)
    visit '/'
    click_link 'Log in'
    fill_in 'Email', with: "ollieyerburgh@test1.com"
    fill_in 'Password', with: 'foobar12'
    click_button 'Log in'
    visit '/activities'
    sleep 5.seconds
    find("#likes_#{activity.id}").text.should include('0')
  end
end
