require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do

  describe 'Activities controller request specs' do
    context 'POST #create' do
      let!(:activity) { FactoryGirl.create(:activity)}
       it 'should create a new activity' do
          params = {
            title: 'Test',
            description: 'Test',
            start_date: '01/02/2003',
            end_date: '01/02/2004',
            deadline: '01/02/2004',
            postcode: 'S102SQ',
            link: 'www.test.com',
            email: 'email@email.com',
          }
          expect { post(:create, params: { activity: params }) }.to change(Activity, :count).by(1)
          expect(flash[:notice]).to eq 'Activity was successfully created.'
       end
      end

    context 'GET #show' do
      activity = FactoryGirl.create(:activity)
      it 'should success and render to show page' do
        user = FactoryGirl.create(:user1)
        login_as(user)
        activity.status = "approved"
        get :show, params: { id: activity.id, format: :json }
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
     end
   end
end
end
