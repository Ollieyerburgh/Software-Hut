class PagesController < ApplicationController

  def home
    @activities = Activity.all
    @current_nav_identifier = :home
  end

  def create_activity
    @current_nav_identifier = :create_activity
  end

  def admin_dashboard
    @activities = Activity.pending
  end


end
