class RequestsController < ApplicationController


  def index
    @activities = Activity.pending

  end

  def show

  end

  def new
  end

  def create
    @activity = Activity.find(params[:id])
    @activity.update_column(:request_status, 'Approved')
    redirect_back(fallback_location: :index)
  end

  def update
    @activity = Activity.find(params[:id])
    puts params[:id]
  end

  def destroy
  end
end
