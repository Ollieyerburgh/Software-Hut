class PreferencesController < ApplicationController
  before_action :set_preference, only: [:show, :edit, :update, :destroy]

  # GET /preferences
  def index
    @preferences = Preference.all
    @user = current_user

    #@subject= Subject.all
    #@subject_list=[]
    #@subject.each do |s|
    #  @subject_list << [s.name,s.id]
    #end
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

    #@user = current_user
    #@preference = Preference.new(preference_params)
    #@preference.user_id = @user.id

    if @preference.save
      redirect_to preferences_path, notice: 'Preference was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /preferences/1
  def update
    if @preference.update(preference_params)
      redirect_to @preference, notice: 'Preference was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /preferences/1
  def destroy
    @preference.destroy
    redirect_to preferences_url, notice: 'Preference was successfully destroyed.'
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
