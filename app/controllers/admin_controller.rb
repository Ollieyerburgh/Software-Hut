class AdminController < ApplicationController

  def index
    @activities = Activity.pending
  end

  def create
    @activity = Activity.find(params[:id])
    @activity.update_column(:request_status, 'Approved')
    redirect_back(fallback_location: :index)
  end

  def edit
    @activity = Activity.find(params[:id])
    puts params[:id]
    # activity must be linked to user, so that can email them specifically

  end


  def dash
    @activities_pending = Activity.pending
    @activities_approved = Activity.approved
    @users = User.all

  end

end
