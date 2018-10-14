class ApplicationController < ActionController::API
  def test_connection
    render_success('ok')
  end

  private

  def render_success(data, status: 200)
    render json: { data: data, status: status }
  end

  def render_failure(ex)
    json = { message: ex.message, errors: ex.errors, details: ex.details }
    render json: json, status: ex.status_code
  end
end
