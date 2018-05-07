class PagesController < ApplicationController

  def home
    @activities = Activity.all.order(cached_votes_up: :desc)
    @subjects = Subject.all.limit(20)
    @current_nav_identifier = :home
    @themes =  ['Careers', 'Employability', 'Higher Education', 'University',
      'Apprenticeship', 'Work-Related Learning', 'Subject Knowledge, Enrichement',
      'Confidence/Aspriation', 'Citizenship', 'Health & Wellbeing', 'Study Skills',
      'Soft Skills']
    @deliveries =  ['In school/college', 'Out of school/college', 'Online']

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
