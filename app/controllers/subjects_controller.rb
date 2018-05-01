class SubjectsController < ApplicationController

  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  def create
    subject_params = params.require(:subject).permit(:name)
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to "/admin/preferences/index", notice: 'Subject was created.'
    else
      render :new
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.update(subject_params)
      redirect_to "/admin/preferences/index", notice: 'Subject was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
    redirect_to admin_preference_path, method: :get, notice: 'Subject was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subject_params
      params.require(:subject).permit(:name)
    end
end
