class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]
  authorize_resource

  # GET /deliveries
  def index
    @deliveries = Delivery.all
  end



  # GET /deliveries/new
  def new
    @delivery = Delivery.new
  end

  # GET /deliveries/1/edit
  def edit
  end

  # POST /deliveries
  def create
    delivery_params = params.require(:delivery).permit(:method)
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      redirect_to "/admin/preferences/index", notice: 'Delivery was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /deliveries/1
  def update
    if @delivery.update(delivery_params)
      redirect_to "/admin/preferences/index", notice: 'Delivery was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /deliveries/1
  def destroy
    @delivery.destroy
    redirect_to "/admin/preferences/index", notice: 'Delivery was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def delivery_params
      params.require(:delivery).permit(:method, :created_at, :updated_at)
    end
end
