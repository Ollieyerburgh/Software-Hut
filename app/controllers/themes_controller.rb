class ThemesController < ApplicationController
  def new
    @theme = Theme.new
  end

  def create
    theme_params = params.require(:theme).permit(:name)
    @theme = Theme.new(theme_params)

    if @theme.save
      redirect_to new_theme_path, notice: 'Theme was created'
    else
      render :new
    end
  end

end
