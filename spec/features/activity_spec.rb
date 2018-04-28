require 'rails_helper'

describe 'Managing activites', js: true do


  specify do 'I cannot create an activity without filling in Title'
    visit '/'
    click_link 'Create Activity'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Start Date', with: '01/02/2003'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    check 'activity_terms_of_service'
    click_button 'Create Activity'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify do 'I cannot create an activity without filling in description'
    visit '/'
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Start Date', with: '01/02/2003'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    check 'activity_terms_of_service'
    click_button 'Create Activity'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify do 'I cannot create an activity without filling in Start Date'
    visit '/'
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    check 'activity_terms_of_service'
    click_button 'Create Activity'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify do 'I cannot create an activity without filling in End Date'
    visit '/'
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Start Date', with: '01/02/2003'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    check 'activity_terms_of_service'
    click_button 'Create Activity'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify do 'I cannot create an activity without filling in Deadline Date'
    visit '/'
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Start Date', with: '01/02/2003'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    check 'activity_terms_of_service'
    click_button 'Create Activity'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify do 'I cannot create an activity without filling in Web Address '
    visit '/'
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Start Date', with: '01/02/2003'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    check 'activity_terms_of_service'
    click_button 'Create Activity'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify do 'I cannot create an activity without filling in postcode'
    visit '/'
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Start Date', with: '01/02/2003'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Email', with: 'test@hotmail.com'
    check 'activity_terms_of_service'
    click_button 'Create Activity'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end

  specify do 'I cannot create an activity without filling in Email '
    visit '/'
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Start Date', with: '01/02/2003'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    check 'activity_terms_of_service'
    click_button 'Create Activity'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end


  specify do 'I cannot create an activity without filling in Email in the valid format '
    visit '/'
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Start Date', with: '01/02/2003'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test'
    check 'activity_terms_of_service'
    click_button 'Create Activity'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "Invalid email address"
  end

  specify do 'I cannot create an activity without filling in Postcode in the valid format '
    visit '/'
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Start Date', with: '01/02/2003'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: '1GL103QX$'
    fill_in 'Email', with: 'test@hotmail.com'
    check 'activity_terms_of_service'
    click_button 'Create Activity'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "Invalid postcode format"
  end

  specify do 'I cannot create an activity without filling in date in correct format'
    visit '/'
    click_link 'Create Activity'
    fill_in 'Title', with: 'Test-title'
    fill_in 'Activity description', with: 'Test-Description'
    fill_in 'Start Date', with: '01/02/03'
    fill_in 'End Date', with: '01/02/2004'
    fill_in 'Deadline for application', with: '01/02/2004'
    fill_in 'Web address of activity', with: 'www.facebook.com'
    fill_in 'Activity postcode', with: 'GL88XY'
    fill_in 'Email', with: 'test@hotmail.com'
    check 'activity_terms_of_service'
    click_button 'Create Activity'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "Invalid date format, please try dd/mm/yyyy"
  end

  specify do 'I can edit an event that I have made'
    activity = FactoryGirl.create(:activity_approved)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test.com"
    fill_in "Password", with: "foobar"
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

  specify do 'I can delete an event that I have made'
    activity = FactoryGirl.create(:activity_approved)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test.com"
    fill_in "Password", with: "foobar"
    click_button "Log in"
    click_link "Saved Activities"
    page.accept_confirm { click_link "Destroy" }
    expect(page).to have_content "Activity was successfully destroyed."
  end

  specify do 'I cannot edit an event that I havnt made'
    activity = FactoryGirl.create(:activity_approved)
    user = FactoryGirl.create(:user1)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test1.com"
    fill_in "Password", with: "foobar"
    click_button "Log in"
    visit '/activities'
    
    expect(page).to have_content "test"
    expect(page).to_not have_content "Edit"
  end

  specify do 'I cannot delete an event that I havnt made'
    activity = FactoryGirl.create(:activity_approved)
    user = FactoryGirl.create(:user1)
    visit '/'
    click_link "Log in"
    fill_in "Email", with: "ollieyerburgh@test1.com"
    fill_in "Password", with: "foobar"
    click_button "Log in"
    visit '/activities'
    expect(page).to have_content "test"
    expect(page).to_not have_content "Destroy"
  end

  specify do 'As a user, I can see approved guest activities'
    visit '/'
    click_link 'Create Activity'
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

  specify do 'I can search for an event, and like it so that it appears in my saved activities'
  end

  specify do 'I can like an event, which will increase like count by one'
    activity = FactoryGirl.create(:activity_approved)
    user = FactoryGirl.create(:user1)
    visit '/'
    click_link 'Log in'
    fill_in 'Email', with: "ollieyerburgh@test1.com"
    fill_in 'Password', with: 'foobar'
    click_button 'Log in'
    visit '/activities'
    sleep 5.seconds
    find("#likes_#{activity.id}").text.should include('0')

  end
end
