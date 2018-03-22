class Admin::RequestsController < ApplicationController

  def index
    @activities = Activity.pending

  end

  def show
    @activities = Activity.pending
  end

  def new
  end

  def edit
    @activity = Activity.find(params[:id])
    puts params[:id]
    @activity.update_column(:status, 'rejected')
    redirect_back(fallback_location: :index)

  end

  def create
    @activity = Activity.find(params[:id])
    @activity.update_column(:status, 'approved')
    redirect_back(fallback_location: :index)
  end

  def update

  end

  def destroy
  end


end
