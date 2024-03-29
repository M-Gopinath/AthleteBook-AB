# Helpers for json response render
module JsonRenderHelper
  def render_success(data, status = :ok)
    h = {
      result: true
    }
    h.merge!(data)
    render json: h, status: status
  end

  def render_failed(data, status = :ok)
    h = {
      result: false
    }
    h.merge!(data)
    render json: h, status: status
  end

  def render_error(data, status = :internal_server_error)
    h = {}
    h.merge!(data)
    render json: h, status: status
  end

  def render_error_msg(msg, status = :internal_server_error)
    h = {
      msg: msg
    }
    render json: h, status: status
  end
end
