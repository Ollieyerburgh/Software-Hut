class Admin::RequestsController < ApplicationController

  def index
    @activities = Activity.pending

  end

  def show
    @activities = Activity.pending
  end

  def new
  end

  def create
    @activity = Activity.find(params[:id])
    @activity.update_column(:status, 'approved')
    redirect_back(fallback_location: :index)
  end

  def update
    @activity = Activity.find(params[:id])
    puts params[:id]
  end

  def destroy
  end


end
