class SearchesController < ApplicationController


  respond_to :js, :json, :html

  # GET /searches/1
  def show
    @search=params[:search]
    p params
    @subject=params[:subject]
    if @subject=="Subject"
      puts "Subject not supplied"
    end
    @distance = Google::Maps.distance("GL88XY", "S102SQ")
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
