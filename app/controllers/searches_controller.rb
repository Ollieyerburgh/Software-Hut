class SearchesController < ApplicationController

  # GET /searches/1
  def show
    @search=params[:search]
    @activities = Activity.where("lower(description) LIKE ? OR lower(title) LIKE ? OR lower(address) LIKE ?", "%#{@search.downcase}%","%#{@search.downcase}%" ,"%#{@search.downcase}%").paginate(page: params[:page], per_page: 10)
    @resources = Resource.where("lower(description) LIKE ? OR lower(link) LIKE ? OR lower(title) LIKE ? OR lower(email) LIKE ?", "%#{@search.downcase}%","%#{@search.downcase}%", "%#{@search.downcase}%" ,"%#{@search.downcase}%").paginate(page: params[:page], per_page: 10)
    @results_length = @activities.size + @resources.size
  end

  # GET /searches/new
  def new

  end


end
