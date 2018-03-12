class AdminController < ApplicationController

  def index
    @events = Event.pending
  end

  def approve
    puts "hellooooodsfkjhdsjkfhdksgfjkhdsjkfs"
    puts params[:id]
    puts "above"
    @event = Event.find(params[:id])
    puts "made it "

    @event.update_column(:request_status, 'Approved')
    puts "made it 1"
    redirect_back(fallback_location: :index)
  end

end
