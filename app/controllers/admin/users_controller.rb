# This controller is used when an admin is managing users on their dashboard
class Admin::UsersController < ApplicationController

  authorize_resource

  # GET /admins/users
  def index
    @users = User.all
  end

  # GET /admins/users/1
  def show
    @users = User.all
    @admins = Admin.all
  end

  # GET /admins/users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PATCH/PUT /resources/1
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to '/admin/users/show/', notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /resources/1
  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to '/admin/users/show/', notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:forename, :surname, :email, :id, :password, :password_confirmation, :current_password, :postcode)
    end
end
