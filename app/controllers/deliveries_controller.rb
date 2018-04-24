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


  def delivery_params
    params.require(:delivery).permit(:method)
  end
end
