class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  authorize_resource
  # GET /resources
  def index
    @resources = Resource.all
  end

  # GET /resources/1
  def show
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  def create
    if user_signed_in?
      @resource = Resource.new(resource_params)
      @resource.user_id = current_user.id
      @resource.status = 'pending'
    else
      @resource = Resource.new(resource_params)
      @resource.status = 'pending'
    end
    if @resource.save
      redirect_to @resource, notice: 'Resource was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /resources/1
  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: 'Resource was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /resources/1
  def destroy
    @resource.destroy
    redirect_to resources_url, notice: 'Resource was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:resource).permit(:title, :description, :email, :terms_of_service, :link, :file, :file_cache)
    end
end
