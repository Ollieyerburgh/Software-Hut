class ActivitiesController < ApplicationController


  before_action :set_activity, only: [:show, :edit, :update, :destroy, :vote]
  respond_to :js, :json, :html
  skip_before_action :verify_authenticity_token
  authorize_resource :except => [:vote]


  # GET /activities
  def index
    @current_nav_identifier = :index
    @activities = Activity.approved
    @user = current_user
  end

  def pending
    @activities = Activity.pending
  end
  # GET /activities/1
  def show
  end

  # GET /activities/new
  def new
    @current_nav_identifier = :new_activity
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  def create
    @activity = Activity.new(activity_params)
    if (admin_signed_in? == false) && (user_signed_in? == false)
      @activity.user_id = '100000'
    else
      @activity.user_id = current_user.id
    end
    if @activity.save
      redirect_to :root, notice: 'Activity was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /activities/1
  def update
    if @activity.update(activity_params)
      redirect_to @activity, notice: 'Activity was successfully updated.'
    else
      render :edit
    end
  end


  def vote
    if !current_user.liked? @activity
      @activity.liked_by current_user
    elsif current_user.liked? @activity
      @activity.unliked_by current_user
    end
  end

  # DELETE /activities/1
  def destroy
    @activity.destroy
    redirect_to activities_url, notice: 'Activity was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def activity_params
      params.require(:activity).permit(:title, :description, :start_date, :end_date, :deadline, :postcode, :tags, :add_documents, :link, :email,
      :eligability, :capacity, :user_id, :subject_ids)
    end
end
