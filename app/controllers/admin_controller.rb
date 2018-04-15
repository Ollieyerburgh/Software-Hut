class AdminController < ApplicationController

  authorize_resource

  def index
    @activities = Activity.pending
  end

  def create
    @activity = Activity.find(params[:id])
    @activity.update_column(:status, 'approved')
    redirect_back(fallback_location: :index)
  end

  def show
    @users = User.all
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
