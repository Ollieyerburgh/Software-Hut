require 'rails_helper'

describe 'Authorisation', js: true do
  specify 'I can create an activity when not signed in' do
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
  specify 'I cannot visit Admin invite admin when a guest' do
    visit '/admin/requests/show'
    expect(page).to have_content 'Access Denied 403'
  end
  specify 'I cannot visit Admin approve requests when a guest' do
    visit '/admin/registrations'
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
  specify 'I cannot visit Admin invite admin when a user' do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit '/admin/requests/show'
    expect(page).to have_content 'Access Denied 403'
  end
  specify 'I cannot visit Admin approve requests when a user' do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit '/admin/registrations'
    expect(page).to have_content 'Access Denied 403'
  end

  specify 'I can visit Admin dashboard when a admin' do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/admin'

    expect(page).to have_content 'Activity requests'
  end

  specify 'I can visit User user manage when a admin' do
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


end
