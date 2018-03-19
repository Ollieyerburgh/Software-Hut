class AdminController < ApplicationController

  def index
    @events = Event.pending
  end

  def create
    @event = Event.find(params[:id])
    @event.update_column(:request_status, 'Approved')
    redirect_back(fallback_location: :index)
  end

  def edit
    @event = Event.find(params[:id])
    puts params[:id]
    # Event must be linked to user, so that can email them specifically

  end


  def dash
    @events_pending = Event.pending
    @events_approved = Event.approved
    @users = User.all

  end

end
