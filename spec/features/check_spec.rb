require 'rails_helper'

describe 'Can create activity' do
  specify 'i can create an activity ' do
    activity = FactoryGirl.create(:activity)
  end
end
