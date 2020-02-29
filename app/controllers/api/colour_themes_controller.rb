class Api::ColourThemesController < ApplicationController
  before_action :permitted_params, only: [:create, :update]

  def index
    render json: ColourThemeSerializer.new(colour_themes).serialized_json
  end

  def create
    create_params = @colour_theme_params.merge(user: current_user)
    service = ColourThemes::CreateService.new(create_params)

    if service.call
      render json: ColourThemeSerializer.new(service.colour_theme)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  def update
    update_params = @colour_theme_params.merge(colour_theme: colour_theme)

    service = ColourThemes::UpdateService.new(update_params)

    if service.call
      render json: ColourThemeSerializer.new(service.colour_theme)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  def destroy
    service = ColourThemes::DestroyService.new(colour_theme: colour_theme)

    if service.call
      render_json_success
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  private

  def permitted_params
    @colour_theme_params = params.require(:colour_theme).permit(
      :light,
      :dark,
      :highlight
    )
  end

  def colour_theme
    @colour_theme ||= ColourTheme.find(params[:id])
  end

  def colour_themes
    @colour_themes = ColourTheme.where(user: current_user)
  end
end
