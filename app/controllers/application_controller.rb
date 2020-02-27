class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def json_response(object, include_data: '', custom_include_data: nil, include_params: nil, meta: {}, stats: {}, status: :ok)
    render_data = {
      json: object,
      include: include_data,
      include_params: custom_include_data || include_params,
      status: status,
      meta: meta.merge(stats: stats),
      adapter: :json
    }

    render(render_data)
  end

  def render_unprocessable_entity!(errors)
    json_response(
      nil,
      meta: { status: 'KO', message: serialize_errors(errors) },
      status: :unprocessable_entity,
    )
  end

  def render_json_success(meta = { status: 'OK', message: 'Successfully handled json'})
    json_response(
      nil,
      status: :ok,
      meta: meta,
      )
  end

  def render_not_found!
    json_response(
      nil,
      meta: { status: 'KO', message: 'The resource you are looking for does not exist' },
      status: :not_found,
    )
  end

end
