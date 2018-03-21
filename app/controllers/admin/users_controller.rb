class Admin::UsersController < ApplicationController
#  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /resources
  def index
    @users = User.all
  end

  # GET /resources/1
  def show
    @users = User.all
  end

  # GET /resources/new
  def new
    @users = User.new
  end

  # GET /resources/1/edit
  def edit
    @user = User.find(params[:id])

  end

  # POST /resources
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'Resource was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /resources/1
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to edit_admin_user_path, notice: 'Resource was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /resources/1
  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to admin_index_path, notice: 'Resource was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:forename, :surname, :email, :id)
    end
end
