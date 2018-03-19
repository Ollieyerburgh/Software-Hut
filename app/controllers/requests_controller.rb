class RequestsController < ApplicationController


  def index
    @events = Event.pending

  end

  def show
    
  end

  def new
  end

  def create
    @event = Event.find(params[:id])
    @event.update_column(:request_status, 'Approved')
    redirect_back(fallback_location: :index)
  end

  def update
    @event = Event.find(params[:id])
    puts params[:id]
  end

  def destroy
  end
end
