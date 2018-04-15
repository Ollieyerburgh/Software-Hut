class SearchesController < ApplicationController

  respond_to :js, :json, :html

  # GET /searches/1
  def show
    @search=params[:query]
    @postcode = params[:postcode]
    @subject=params[:subject]
    if @subject=="Subject"
      puts "Subject not supplied"
    end

    @activities = Activity.filter(params.slice(:query, :subject)) #.paginate(page: params[:page], per_page: 10)
    @resource = Resource.filter(params.slice(:query, :subject, :distance)) #.paginate(page: params[:page], per_page: 10)
    @distance = Google::Maps.distance("GL88XY", "S102SQ")
    @results_length = 0 #@activities.size + @resources.size

  end

  # GET /searches/new
  def new

  end

  def vote
    if !current_user.liked? @activity
      @activity.liked_by current_user
    elsif current_user.liked? @activity
      @activity.unliked_by current_user
    end
  end

end
