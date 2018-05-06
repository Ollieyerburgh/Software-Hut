class AdminController < ApplicationController

  authorize_resource

  def index
    @activities = Activity.pending
    @current_nav_identifier = :dashboard
  end



end
