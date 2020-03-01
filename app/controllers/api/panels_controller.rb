class Api::PanelsController < ApplicationController
  before_action :permitted_params, only: [:create, :update]

  def index
    render json: PanelSerializer.new(panels, options).serialized_json
  end

  def create
    create_params = @panel_params.merge(user: current_user)

    service = Panels::CreateService.new(create_params)

    if service.call
      render json: PanelSerializer.new(panels, options)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  def update
    update_params = @panel_params.merge(panel: panel)

    service = Panels::UpdateService.new(update_params)

    if service.call
      render json: PanelSerializer.new(panels, options)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  def destroy
    service = Panels::DestroyService.new(panel: panel)

    if service.call
      render_json_success
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  private

  def panels
    @panels = Panel.eager_load(:tasks, :colour_theme).where(user: User.first)
  end

  def panel
    @panel ||= Panel.find(params[:id])
  end

  def permitted_params
    @panel_params = params.require(:panel).permit(
      :id,
      :name,
      :colour_theme_id
    )
  end

  def options
    options = {
      include: [:tasks, :colour_theme]
    }
  end
end
