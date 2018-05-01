class AgesController < ApplicationController


  def new
    @age = Age.new
  end


  def create
    age_params = params.require(:age).permit(:age)
    @age = Age.new(age_params)

    if @age.save
      redirect_to new_age_path, notice: 'Age was created'
    else
      render :new
    end
  end
end
