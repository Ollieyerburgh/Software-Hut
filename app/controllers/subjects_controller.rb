class SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end

  def create
    subject_params = params.require(:subject).permit(:name)
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to new_subject_path, notice: 'Subject was created.'
    else
      render :new
    end
  end
end
