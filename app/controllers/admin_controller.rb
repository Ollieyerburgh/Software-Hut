class AdminController < ApplicationController

  authorize_resource

  def index
    @activities = Activity.pending.paginate(page: params[:page], per_page: 10)
    @current_nav_identifier = :dashboard
  end



end
