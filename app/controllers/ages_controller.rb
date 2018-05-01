class AgesController < ApplicationController
  before_action :set_age, only: [:show, :edit, :update, :destroy]
  authorize_resource

  # GET /ages
  def index
    @ages = Age.all
  end

  # GET /ages/new
  def new
    @age = Age.new
  end

  # GET /ages/1/edit
  def edit
  end

  # POST /ages
  def create
    age_params = params.require(:age).permit(:age)
    @age = Age.new(age_params)

    if @age.save
      redirect_to "/admin/preferences/index", notice: 'Age was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ages/1
  def update
    if @age.update(age_params)
      redirect_to "/admin/preferences/index", notice: 'Age was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ages/1
  def destroy
    @age.destroy
    redirect_to admin_preference_path, method: :get, notice: 'Age was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_age
      @age = Age.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def age_params
      params.require(:age).permit(:age)
    end
end
