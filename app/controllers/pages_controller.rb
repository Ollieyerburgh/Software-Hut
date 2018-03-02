class PagesController < ApplicationController

  def home
    @events = Event.all
    @current_nav_identifier = :home
  end

  def create_event
    @current_nav_identifier = :create_event
  end

end
