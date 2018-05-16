# This controller is used to display all the preference options in the admin dashboard
class Admin::PreferencesController < ApplicationController
  authorize_resource
  # GET /preferences
  def index
    @preferences = Preference.all
    @user = current_user
  end

  # GET /preferences/1
  def show
    @subjects = Subject.all
    @themes = Theme.all
    @deliveries = Delivery.all
    @ages = Age.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preference
      @preference = Preference.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def preference_params
      params.require(:preference).permit(subject_ids: [], theme_ids: [], delivery_ids: [], age_ids: [])
    end
end
