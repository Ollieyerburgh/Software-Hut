class DeliveriesController < ApplicationController
  def new
    @delivery = Delivery.new
  end

  def create
    delivery_params = params.require(:delivery).permit(:method)
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      redirect_to new_delivery_path, notice: 'Delivery was created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @delivery.update(delivery_params)
      redirect_to @delivery, notice: 'Delivery was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @delivery.destroy
    redirect_to deliveries_url, notice: 'Delivery was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def delivery_params
      params.require(:delivery).permit(:method)
    end
end
