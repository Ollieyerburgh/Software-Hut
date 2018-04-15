class SearchesController < ApplicationController


  respond_to :js, :json, :html

  get the best matches 
  find 30 which are in users circumference 
  if user get his postcode 
  
  # GET /searches/1
  def show
    @search=params[:search]
    @postcode = params[:postcode]
    @subject=params[:subject]
    if @subject=="Subject"
      puts "Subject not supplied"
    end

    @activities = Activity.filter(params.slice(:search, :subject, :distance)).paginate(page: params[:page], per_page: 10)
    @resource = Resource.filter(params.slice(:search, :subject, :distance)).paginate(page: params[:page], per_page: 10)

    @distances = Google::Maps.distance("GL88XY", "S102SQ")
    @activities = Activity.where("lower(description) LIKE ? OR lower(title) LIKE ? OR lower(address) LIKE ?", "%#{@search.downcase}%","%#{@search.downcase}%" ,"%#{@search.downcase}%").paginate(page: params[:page], per_page: 10)
    @resources = Resource.where("lower(description) LIKE ? OR lower(link) LIKE ? OR lower(title) LIKE ? OR lower(email) LIKE ?", "%#{@search.downcase}%","%#{@search.downcase}%", "%#{@search.downcase}%" ,"%#{@search.downcase}%").paginate(page: params[:page], per_page: 10)
    @results_length = @activities.size + @resources.size

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
