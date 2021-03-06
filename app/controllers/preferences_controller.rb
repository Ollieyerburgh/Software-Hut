# This class is used for when dealing with the preferences of the user
# Key points: a user can only have one preference so an appropriate method
# was implemented for checking this.

class PreferencesController < ApplicationController

  before_action :set_preference, only: [:show, :edit, :update, :destroy]
  authorize_resource # Only users with accounts can access this functionality

  # Check for only one preference, can only call new for adding a new preference
  # if user doesn't have one yet
  before_action :only_one_pref, only: [:new] 

  # GET /preferences
  def index
    @preferences = Preference.all
    # Get specific preference for specific user
    @user = current_user
  end

  # GET /preferences/1
  def show
  end

  # GET /preferences/new
  def new
    @preference = Preference.new
  end

  # GET /preferences/1/edit
  def edit
  end

  # POST /preferences
  def create
    if user_signed_in?
      @preference = Preference.new(preference_params)
      @preference.user_id = current_user.id
    else
      @preference = Activity.new(preference_params)
    end

    if @preference.save
      redirect_to preferences_path, notice: 'Preference was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /preferences/1
  def update
    if @preference.update(preference_params)
      redirect_to root_path, notice: 'Preference was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /preferences/1
  def destroy
    @preference.destroy
    redirect_to preferences_url, notice: 'Preference was successfully destroyed.'
  end

  # only_one_pref returns a boolean
  # A user can only have one preference, the user should not be allowed to
  # create more than one preferences.
  def only_one_pref
      return unless !(Preference.all.length < 1)
      redirect_to preferences_path, alert: 'One preference only.'
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
