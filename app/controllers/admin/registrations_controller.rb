# This is controller that allows an admin to create a new admin on the admin dashboard
class Admin::RegistrationsController < ApplicationController
  load_and_authorize_resource class: "Admin", param_method: :admin_params


  def new
    @admins = Admin.new
  end

  # Creates new admin taking the parameters from the form
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to :admin_index, :flash => { :notice => "Admin added" }
    else
      render :new, :flash => { :notice => "Admin not saved" }

    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation, :higher_access)
    end
end
