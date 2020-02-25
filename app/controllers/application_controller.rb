class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json

  include Pundit

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

end
