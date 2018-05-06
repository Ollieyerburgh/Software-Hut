class PagesController < ApplicationController

  def home
    @activities = Activity.all.order(cached_votes_up: :desc)
    @subjects = Subject.all.limit(20)
    @current_nav_identifier = :home
  end

  def help
    authorize! :help, @pages
  end

  def analytics
    @users = User.all.paginate(page: params[:page], per_page: 14)
    @learners = User.where(role: 'Learner')
    @partners = User.where(role: 'Partner')
    @parents = User.where(role: 'Guardian/Parent')
    @teachers = User.where(role: 'Teacher/Advisor')
    authorize! :analytics, @pages
  end




end
