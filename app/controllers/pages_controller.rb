class PagesController < ApplicationController


  def home
    @activities = Activity.all.order(cached_votes_up: :desc)
    @subjects = Subject.all.limit(20)
    @current_nav_identifier = :home
  end

  def create_activity
    @current_nav_identifier = :create_activity
  end

  def admin_dashboard
    @activities = Activity.pending
  end


end
