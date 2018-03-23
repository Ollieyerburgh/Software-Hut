class SearchesController < ApplicationController

  # GET /searches/1
  def show
    @search=params[:search]
    @activities = Activity.where("lower(description) LIKE ?", "%#{@search.downcase}%" ).paginate(page: params[:page], per_page: 10)
    @resources = Resource.where("lower(description) LIKE ?", "%#{@search.downcase}%" ).paginate(page: params[:page], per_page: 10)
    @results_length = @activities.size + @resources.size
  end

  # GET /searches/new
  def new

  end


end
