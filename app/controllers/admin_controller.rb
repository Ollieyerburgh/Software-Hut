class AdminController < ApplicationController

  def requests
    @events = Event.pending
  end

  def approve
    @event = Event.find(params[:id])
    @event.update_column(:request_status, 'Approved')
    redirect_back(fallback_location: :index)
  end

  def reject
    @event = Event.find(params[:id])
    puts params[:id]
    # Event must be linked to user, so that can email them specifically

  end

end
