class Api::PanelsController < ApplicationController
  before_action :set_panels

  def index
    render json: PanelSerializer.new(@panels, options).serialized_json
  end

  private

  def set_panels
    # @panels = Panel.eager_load(:task).where(user: current_user)
    @panels = Panel.eager_load(:tasks, :colour_theme).where(user_id: 1)
  end

  def options
    options = {
      include: [:tasks, :colour_theme]
    }
  end

end
