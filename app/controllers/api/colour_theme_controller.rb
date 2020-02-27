class Api::ColourThemeController < ApplicationController
  before_action :permitted_params, only: [:create, :update, :destroy]
  # before_action :set_colour_theme, only: [:update, :destroy]

  def create
    service = ColourThemes::CreateService.new(@colour_theme_params)

    if service.call
      render json: ColourThemeSerializer.new(service.colour_theme)
    else
      render_unprocessable_entity!(service.errors)
    end

  end

  def update
    set_colour_theme(@colour_theme_params[:id])
    update_params = @colour_theme_params.merge(colour_theme: @colour_theme)

    service = ColourThemes::UpdateService.new(update_params)

    if service.call
      render json: ColourThemeSerializer.new(service.colour_theme)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  def destroy
    colour_theme_params = permitted_params

    service = ColourThemes::DestroyService.new(colour_theme_params)

    if service.call
      render_json_success
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  private

  def permitted_params
    @colour_theme_params = params.require(:colour_theme).permit(
      :id,
      :light,
      :dark,
      :highlight
    )
  end

  def set_colour_theme(id)
    @colour_theme = ColourTheme.find(id)
    render_not_found! unless @colour_theme
  end
end
