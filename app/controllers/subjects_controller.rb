class SubjectsController < ApplicationController
<<<<<<< HEAD
=======
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  def show
    
  end

  # GET /subjects/new
>>>>>>> 7efec930590b078560381c1dc02a45ebdcd152f3
  def new
    @subject = Subject.new
  end

<<<<<<< HEAD
  def create
    subject_params = params.require(:subject).permit(:name)
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to new_subject_path, notice: 'Subject was created.'
=======
  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to @subject, notice: 'Subject was successfully created.'
>>>>>>> 7efec930590b078560381c1dc02a45ebdcd152f3
    else
      render :new
    end
  end
<<<<<<< HEAD
=======

  # PATCH/PUT /subjects/1
  def update
    if @subject.update(subject_params)
      redirect_to @subject, notice: 'Subject was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
    redirect_to subjects_url, notice: 'Subject was successfully destroyed.'
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
>>>>>>> 7efec930590b078560381c1dc02a45ebdcd152f3
end
