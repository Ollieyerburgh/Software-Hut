require 'will_paginate/array' 

GOOGLE_MAPS_API_KEY='AIzaSyDBMRmPZIprE8Ythh4OtZr6isPJKcrgtAE'

class SearchesController < ApplicationController

  respond_to :js, :json, :html

  # GET /searches/1
  def show
    @search=params[:query]
    @postcode = params[:postcode]
    @distance = params[:distance]

    puts @postcode
    puts "above"
    @subject=params[:subject]
    if @subject=="Subject"
      puts "Subject not supplied"
    end

    @activities = Activity.filter(params.slice(:query, :subject)).paginate(page: params[:page], per_page: 10)
    @resources = Resource.filter(params.slice(:query, :subject)).paginate(page: params[:page], per_page: 10)
    
    @distances = []

    @activities.each { |activity| 
      postcode = activity.postcode
      distance = Google::Maps.distance(@postcode.to_s, "RG45 7ND")
      @distances.push(distance)
    }
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
