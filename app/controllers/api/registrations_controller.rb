class Api::RegistrationsController < Devise::RegistrationsController
  def create
    return unless params[:email] && params[:password] && params[:username]

    build_resource(sign_up_params)
    resource.save

    if resource.persisted?
      default_colour_themes
      # create panels & attach to user
      today  = Panel.create(name: "today", user: resource, colour_theme: default_colour_themes[:candy])
      soon = Panel.create(name: "soon", user: resource, colour_theme: default_colour_themes[:sherbert])
      someday = Panel.create(name: "someday", user: resource, colour_theme: default_colour_themes[:sunrise])

      Task.create(text: "Brainstorm some tasks", user: resource, panel: today, completed: false)
      Task.create(text: "Write that email I've been meaning to send for ages...", user: resource, panel: soon, completed: false)
      Task.create(text: "Walk on the moon", user: resource, panel: someday, completed: false)

      render json: PanelSerializer.new(resource.panels, options).serialized_json
    else
      render_unprocessable_entity!(resource.errors)
    end
  end

  private

  def sign_up_params
    params.permit(:email, :password, :username)
  end

  def default_colour_themes
    @default_colour_themes = {
      candy: ColourTheme.find(1),
      sherbert: ColourTheme.find(2),
      sunrise: ColourTheme.find(3)
    }
  end

  def options
    options = {
      include: [:tasks, :colour_theme]
    }
  end
end
