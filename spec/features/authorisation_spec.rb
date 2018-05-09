require 'rails_helper'

describe 'Authorisation', js: true do
  specify 'I can create an activity when not signed in' do
    visit '/activities/new'
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
    expect(page).to have_content 'Activity was successfully created'

  end

  specify 'I cannot visit Admin dashboard when a guest' do
    visit '/admin'
    expect(page).to have_content 'Access Denied 403'
  end
  specify 'I cannot see saved activities link, or access through URL' do
    visit '/'
    expect(page).not_to have_content 'Saved Activities'
    visit '/activities'
    expect(page).to have_content 'Sorry, to access this feature you need to sign up'
  end
  specify 'I cannot visit Admin user manage when a guest' do
    visit '/admin/users/show'
    expect(page).to have_content 'Access Denied 403'
  end
  specify 'I cannot visit Admin approve requests when a guest' do
    visit '/admin/requests/show'
    expect(page).to have_content 'Access Denied 403'
  end
  specify 'I cannot visit Admin invite when a guest' do
    visit '/admin/registrations/new'
    expect(page).to have_content 'Access Denied 403'
  end

  specify 'I cannot visit subject create or edit as a guest' do
    subject = FactoryGirl.create(:subject)
    visit '/subjects/new'
    expect(page).to have_content 'Access Denied 403'
    visit '/subjects/1/edit'
    expect(page).to have_content 'Access Denied 403'
  end

  specify 'I cannot visit theme create or edit as a guest' do
    theme = FactoryGirl.create(:theme)
    visit '/themes/new'
    expect(page).to have_content 'Access Denied 403'
    visit '/themes/1/edit'
    expect(page).to have_content 'Access Denied 403'

  end

  specify 'I cannot visit age create or edit as a guest' do
    age = FactoryGirl.create(:age)
    sleep (1)
    visit '/ages/new'
    expect(page).to have_content 'Access Denied 403'
    visit '/ages/1/edit'
    expect(page).to have_content 'Access Denied 403'

  end


  specify 'I cannot visit subject create or edit as a user' do
    user = FactoryGirl.create(:user)
    login_as(user)
    subject = FactoryGirl.create(:subject)
    visit '/subjects/new'
    expect(page).to have_content 'Access Denied 403'
    visit '/subjects/1/edit'
    expect(page).to have_content 'Access Denied 403'
  end

  specify 'I cannot visit theme create or edit as a user' do
    user = FactoryGirl.create(:user)
    login_as(user)
    theme = FactoryGirl.create(:theme)
    visit '/themes/new'
    expect(page).to have_content 'Access Denied 403'
    visit '/themes/1/edit'
    expect(page).to have_content 'Access Denied 403'

  end

  specify 'I cannot visit age create or edit as a user' do
    user = FactoryGirl.create(:user)
    login_as(user)
    age = FactoryGirl.create(:age)
    visit '/ages/new'
    expect(page).to have_content 'Access Denied 403'
    visit '/ages/1/edit'
    expect(page).to have_content 'Access Denied 403'

  end

  specify 'I cannot visit delivery method create or edit as a user' do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/deliveries/new'
    fill_in 'Method', with: 'test'
    click_button 'Create Delivery'
    find('.dropdown-toggle').click
    click_link "Log out"
    user = FactoryGirl.create(:user)
    login_as(user)
    visit '/deliveries/new'
    expect(page).to have_content 'Access Denied 403'
    visit '/deliveries/1/edit'
    expect(page).to have_content 'Access Denied 403'
  end


  specify 'I cannot visit delivery method create or edit as a guest' do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/deliveries/new'
    expect(page).to have_content "New delivery"
    fill_in 'Method', with: 'test'
    click_button 'Create Delivery'
    find('.dropdown-toggle').click
    click_link "Log out"
    visit '/deliveries/new'
    expect(page).to have_content 'Access Denied 403'
    visit '/deliveries/1/edit'
    expect(page).to have_content 'Access Denied 403'
  end

  specify 'I cannot visit Admin dashboard when a user' do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit '/admin'
    expect(page).to have_content 'Access Denied 403'
  end

  specify 'I cannot visit Admin user manage when a user' do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit '/admin/users/show'
    expect(page).to have_content 'Access Denied 403'
  end
  specify 'I cannot visit Admin approve requests when a user' do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit '/admin/requests/show'
    expect(page).to have_content 'Access Denied 403'
  end
  specify 'I cannot visit Admin invite when a user' do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit '/admin/registrations/new'
    expect(page).to have_content 'Access Denied 403'
  end

  specify 'I can visit Admin dashboard when a admin' do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/admin'

    expect(page).to have_content 'Manage requests'
  end

  specify 'I can visit User manage when a admin' do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/admin/users/show'
    expect(page).to have_content 'Modify users'
  end
  specify 'I can visit Admin approve requests when a admin' do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/admin/requests/show'
    expect(page).to have_content 'Pending activities'

  end
  specify 'I can visit Admin invite when a admin' do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/admin/registrations/new'
    expect(page).to have_content 'Create an Admin'
  end

  specify 'I cannot visit Add, edit, or delete Themes as a lower level admin' do
    admin1 = FactoryGirl.create(:admin_lower)
    login_as(admin1)
    user = FactoryGirl.create(:user)
    login_as(user)
    theme = FactoryGirl.create(:theme)
    sleep(1)
    visit '/themes/new'
    expect(page).to have_content 'Access Denied 403'
    visit '/themes/1/edit'
    expect(page).to have_content 'Access Denied 403'

  end

  specify 'I cannot visit Add, edit, or delete Subjects as a lower level admin' do
    admin1 = FactoryGirl.create(:admin_lower)
    login_as(admin1)
    subject = FactoryGirl.create(:subject)
    sleep(1)
    visit '/subjects/new'
    expect(page).to have_content 'Access Denied 403'
    visit '/subjects/1/edit'
    expect(page).to have_content 'Access Denied 403'
  end

  specify 'I cannot visit Add, edit, or delete Deliveries as a lower level admin' do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/deliveries/new'
    fill_in 'Method', with: 'test'
    click_button 'Create Delivery'
    sleep(1)
    find('.dropdown-toggle').click
    click_link "Log out"
    admin1 = FactoryGirl.create(:admin_lower)
    login_as(admin1)
    visit '/deliveries/new'
    expect(page).to have_content 'Access Denied 403'
    visit '/deliveries/1/edit'
    expect(page).to have_content 'Access Denied 403'

  end

  specify 'I cannot visit Add, edit, or delete Age as a lower level admin' do
    admin1 = FactoryGirl.create(:admin_lower)
    login_as(admin1)
    age = FactoryGirl.create(:age)
    sleep(1)
    visit '/ages/new'
    expect(page).to have_content 'Access Denied 403'
    visit '/ages/1/edit'
    expect(page).to have_content 'Access Denied 403'
  end





end
