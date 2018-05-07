require 'google_maps_service'

class SearchesController < ApplicationController


  respond_to :js, :json, :html

  # GET /searches/1
  def show

    #get search variables and set search dynamics
    @theme = params[:theme]
    @subject = params[:subject]
    @delivery = params[:delivery]
    @distance_filter = true
    if params[:postcode] == '' && !current_user
      @distance_filter = false
    end
    #filter the activites + resources by query + subject (this uses scopes stored in the relevant models director)
    @activities = Activity.filter(params.slice(:query, :subject, :theme, :delivery)).paginate(page: params[:page], per_page: 10)
    @resources = Resource.filter(params.slice(:query, :subject, :theme, :delivery)).paginate(page: params[:page], per_page: 10)
    p @activities
    p @resources

    if @distance_filter
      #get the postcodes of the activities 
      origins = @activities.all.map {|x| x.postcode}

      #connect to Google maps API client
      gmaps = GoogleMapsService::Client.new(key: 'AIzaSyDdFojl37akCcM9_TICN7BWjSALccfO5g0')

      #get the postcode implemented or the postcode of the user if logged in 
      if current_user 
        destination = current_user.postcode
      else
        destination = params[:postcode]
      end

      #find the distances from activities to inputted postcode
      distance = gmaps.distance_matrix(
        origins,
        destination
      )
      
      #get the distances in an array
      @distances = []
      distance[:rows].each { |distance|
        @distances.push(distance[:elements][0][:distance][:value])
      }

      #remove activities whose distance is greater than specified
      @distances.each_with_index {|distance, index| 
        if (distance > @distance_wanted.to_i)
          @activities = @activities - [@activities[index]]
        end
      }

      #convert activities to hashes (so we can add distances to them)
      @activities_hash = Activity.all.as_json(:root => true)

      #add distances to activities
      @activities_hash.each_with_index {|activity, index| 
        activity['distance'] = @distances[index]
      }

      #order array of activerecord activities results on distance
      @activities.sort_by{|x| @activities_hash.index x['distance']}.reverse!

      #order activities by length of distance
      @activities_hash = @activities.sort_by { |k| k["distance"] }.reverse!

      #turn the hash back into an array for iteration 
      @activities = @activities_hash.values
    end

    #find results length to display on search page
    @results_length = @activities.size + @resources.size 

    #find search query to show on results page
    @search = params[:query]

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
