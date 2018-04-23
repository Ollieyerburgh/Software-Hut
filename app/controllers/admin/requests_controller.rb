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
    if request.post?
      UserMailer.rejection_email(@contact.email, @contact.message, @activity).deliver
      redirect_to "/admin/requests/show", notice: 'Rejection email was sent.'
    end
  end

  def create

    @activity = Activity.find(params[:id])
    UserMailer.acception_email(@activity.email).deliver
    @activity.update_column(:status, 'approved')

    redirect_back(fallback_location: :index)
  end

  def update

  end

  def destroy
  end


end
