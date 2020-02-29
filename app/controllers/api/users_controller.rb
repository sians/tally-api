class Api::UsersController < ApplicationController
  before_action :authenticate_user!
  def me
    render json: UserSerializer.new(current_user).serialized_json
  end
end
