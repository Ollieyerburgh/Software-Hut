class Admin::RegistrationsController < ApplicationController

  

  def new

    @admins = Admin.new
  end


  def create
    @admin = Admin.new(user_params)

    if @admin.save
      redirect_to :admin_index, :flash => { :notice => "Admin added" }
    else
      render :new, :flash => { :notice => "Admin not saved" }

    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:admin).permit(:email, :password, :password_confirmation)
    end
end
