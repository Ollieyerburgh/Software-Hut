class Admin::RequestsController < ApplicationController

  authorize_resource

  def index
    @activities = Activity.pending
    @contact = Request.new(params[:request])
  end

  def show
    @activities = Activity.pending.paginate(page: params[:page], per_page: 10)
    @activitiesrejected = Activity.rejected.paginate(page: params[:page], per_page: 10)
  end

  def new
  end

  def edit
    @activity = Activity.find(params[:id])
    puts params[:id]
    @contact = Request.new(params[:request])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver

        # re-initialize Home object for cleared form
        @contact = Request.new
        format.html { render '/admin/requests/show'}
        format.js   { flash.now[:success] = @message = "Rejected email sent" }
      else
        format.html { render 'edit' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
    @activity.update_column(:status, 'rejected')

  end

  def create
    @activity = Activity.find(params[:id])
    @activity.update_column(:status, 'approved')
    redirect_back(fallback_location: :index)
  end

  def update

  end

  def destroy
  end


end
