class Users::DashController < ApplicationController



  def index
    @user = User.find(params[:id])
  end

  def show
    params[:id] == current_user.id unless params[:id]
    @user = User.find(params[:id])
    @activities = @user.activities
    @pendingactivities = @user.activities.pending.paginate(page: params[:page], per_page: 10)
    @rejectedactivities = @user.activities.rejected.paginate(page: params[:page], per_page: 10)
    @approvedactivities = @user.activities.approved.paginate(page: params[:page], per_page: 10)
    @resources = @user.resources.paginate(page: params[:page], per_page: 10)

  end


  def dash
    @activities_pending = Activity.pending
    @activities_approved = Activity.approved
    @users = User.all

  end
end
