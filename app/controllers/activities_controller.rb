class ActivitiesController < ApplicationController


  before_action :set_activity, only: [:show, :edit, :update, :destroy, :vote]
  respond_to :js, :json, :html
  skip_before_action :verify_authenticity_token
  authorize_resource :except => [:vote]


  # GET /activities
  def index
    @current_nav_identifier = :activities
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
    session[:activity_params] ||= {}
    @activity = Activity.new(session[:activity_params])
    @activity.current_step = session[:activity_step]

  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # Code taken from RailsCasts episode #217 - Multistep forms
  def create
    session[:activity_params].deep_merge!(params[:activity]) if params[:activity]
    if user_signed_in?
      @activity = Activity.new(session[:activity_params])
      @activity.user_id = current_user.id
    else
      @activity = Activity.new(session[:activity_params])
    end
    @activity.current_step = session[:activity_step]
    if @activity.valid?
      if params[:back_button]
        @activity.previous_step
      elsif @activity.last_step
        @activity.save
      else
        @activity.next_step
      end
      session[:activity_step] = @activity.current_step
    end
    if @activity.new_record?
      render :new
    else
      session[:activity_step] = session[:activity_params] = nil
      flash[:notice] = "Activity was successfully created"
      redirect_to :root
    end
  end

  # PATCH/PUT /activities/1
  def update
    if @activity.update(activity_params)
      @activity.update_column(:status, 'pending')
      redirect_to @activity, notice: 'Activity was successfully updated.'
    else
      render :root
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
    @users = @activity.votes_for.up.by_type(User).voters
    @users.each do |user|
      puts @activity.id
      puts user.id
      UserMailer.cancellation_email(user, @activity).deliver
    end
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
      :eligability, :capacity, :user_id, :terms_of_service, subject_ids: [], theme_ids: [], delivery_ids: [], age_ids: []  )
    end
end
