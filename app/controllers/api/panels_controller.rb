class Api::PanelsController < ApplicationController
  before_action :set_panels
  before_action :permitted_params, only: [:create, :update]

  def index
    render json: PanelSerializer.new(@panels, options).serialized_json
  end

  def create
    # create_params = @panel_params.merge(user: current_user)
    create_params = @panel_params.merge(user: User.first)

    service = Panels::CreateService.new(create_params)

    if service.call
      render json: PanelSerializer.new(set_panels, options)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  def update
    set_panel(@panel_params[:id])
    update_params = @panel_params.merge(panel: @panel)

    service = Panels::UpdateService.new(update_params)

    if service.call
      render json: PanelSerializer.new(set_panels, options)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  private

  def set_panels
    # @panels = Panel.eager_load(:task).where(user: current_user)
    @panels = Panel.eager_load(:tasks, :colour_theme).where(user_id: 1)
  end

  def set_panel(id)
    @panel = Panel.find(id)
    render_not_found! unless @panel
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
