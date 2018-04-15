require 'rails_helper'

describe 'Managing activites' do
  

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
    click_button 'Create Activity'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "Invalid postcode format"
  end

  specify do 'I cannot create an activity without filling in dare in correct format'
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
    click_button 'Create Activity'
    expect(page).to have_content 'Please review the problems below:'
    expect(page).to have_content "can't be blank"
  end
end
