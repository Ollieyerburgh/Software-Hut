class Users::DashController < ApplicationController



  def index
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.activities
    @pendingactivities = @user.activities.pending
    @rejectedactivities = @user.activities.rejected
    @approvedactivities = @user.activities.approved
    @resources = @user.resources
  end


  def dash
    @activities_pending = Activity.pending
    @activities_approved = Activity.approved
    @users = User.all

  end
end
