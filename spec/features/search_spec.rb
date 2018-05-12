require 'rails_helper'


describe 'Search tests', js:true do
  before do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit '/deliveries/new'
    fill_in 'Method', with: 'Online'
    click_button 'Create Delivery'
    wait_for_ajax
    find('.dropdown-toggle').click
    click_link "Log out"
    age = FactoryGirl.create(:age)
    theme = FactoryGirl.create(:theme)
    subject = FactoryGirl.create(:subject)
  end

  specify 'I can search as a guest, which takes me to the search page' do
    visit '/'
    fill_in 'query', with: ' '
    page.execute_script("$('form#helloworld').submit()")
    expect(page).to have_current_path(search_path)
    expect(page).to have_content "Found 0 results for " ""
  end

  specify 'I can search as a user, which takes me to the search page' do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit '/'
    fill_in 'query', with: ' '
    page.execute_script("$('form#helloworld').submit()")
    expect(page).to have_current_path(search_path)
    expect(page).to have_content "Found 0 results for " ""
  end

  specify 'I can search as an admin, which takes me to the search page' do
    admin = FactoryGirl.create(:admin_higher2)
    login_as(admin)
    visit '/'
    fill_in 'query', with: ' '
    page.execute_script("$('form#helloworld').submit()")
    expect(page).to have_current_path(search_path)
    expect(page).to have_content "Found 0 results for " ""

  end

  specify 'I can search for a resource' do
    resoucre = FactoryGirl.create(:resource_approved)
    visit '/'
    fill_in 'query', with: 'test-resource'
    page.execute_script("$('form#helloworld').submit()")
    expect(page).to have_current_path(search_path)
    expect(page).to have_content "Found 1 result"
    expect(page).to have_content "test-resource"
  end

  specify 'I can search for an activity' do
    activity = FactoryGirl.create(:activity_approved)
    visit '/'
    fill_in 'query', with: 'test-title'
    page.execute_script("$('form#helloworld').submit()")
    expect(page).to have_current_path(search_path)
    expect(page).to have_content "Found 1 result"
    expect(page).to have_content "www.facebook.com"
  end

  specify 'I can search for an activity using subject' do
    activity = FactoryGirl.create(:activity_subject)
    visit '/'
    fill_in 'query', with: 'test-subject'
    find('#more-filters').click
    select "Maths", :from => "selectsubject"
    wait_for_ajax
    page.execute_script("$('form#helloworld').submit()")
    wait_for_ajax
    expect(page).to have_content "Found 1 result"
    expect(page).to have_content "testing subject search"


  end

  specify 'I can search for an activity using theme' do
    activity = FactoryGirl.create(:activity_theme)
    visit '/'
    fill_in 'query', with: 'test-theme'
    find('#more-filters').click
    select "Careers", :from => "selecttheme"
    page.execute_script("$('form#helloworld').submit()")
    wait_for_ajax
    expect(page).to have_content "Found 1 result"
    expect(page).to have_content "testing theme search"


  end

  specify 'I can search for an activity using delivery method' do
    activity = FactoryGirl.create(:activity_delivery)
    visit '/'
    fill_in 'query', with: 'test-delivery'
    find('#more-filters').click
    select "Online", :from => "selectdelivery"
    wait_for_ajax
    page.execute_script("$('form#helloworld').submit()")
    wait_for_ajax
    expect(page).to have_content "Found 1 result"
    expect(page).to have_content "testing delivery search"

  end

  specify 'I can search for an activity using date' do
    activity = FactoryGirl.create(:activity)
    visit '/'
    fill_in 'query', with: 'test-title'
    find('#more-filters').click
    page.execute_script("$('#start-date-range').val('01/12/2009')")
    page.execute_script("$('#end-date-range').val('05/01/2010')")
    page.execute_script("$('form#helloworld').submit()")
    wait_for_ajax
    expect(page).to have_content "Found 1 result"
    expect(page).to have_content "test-title"
  end

  specify 'I can search for an activity using subject, theme and date' do
    activity = FactoryGirl.create(:activity_all)
    visit '/'
    fill_in 'query', with: 'test-delivery'
    find('#more-filters').click
    select "Maths", :from => "selectsubject"
    select "Careers", :from => "selecttheme"
    select "Online", :from => "selectdelivery"
    page.execute_script("$('#start-date-range').val('01/12/2009')")
    page.execute_script("$('#end-date-range').val('05/01/2010')")
    page.execute_script("$('form#helloworld').submit()")
    wait_for_ajax
    expect(page).to have_content "Found 1 result"

  end

  specify 'I cannot enter a start date before end date' do
    visit '/'
    fill_in 'query', with: 'test-delivery'
    find('#more-filters').click
    page.execute_script("$('#start-date-range').val('01/12/2009')")
    page.execute_script("$('#end-date-range').val('05/01/2010')")
    page.execute_script("$('form#helloworld').submit()")
    expect(page).to have_current_path(root_path)

  end

  specify 'I can search for an activity and a resource at the same time' do
    resource = FactoryGirl.create(:resource)
    activity = FactoryGirl.create(:activity)
    fill_in 'query', with: ' '
    page.execute_script("$('form#helloworld').submit()")
    expect(page).to have_content "Found 2 results"
  end

end
