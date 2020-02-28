class Api::SessionsController < Devise::SessionsController

  def respond_with(resource, _opts = {})
    render json: UserSerializer.new(resource).serialized_json
  end

end
