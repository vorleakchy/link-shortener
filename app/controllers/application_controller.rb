class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def render_not_found
    render plain: '404', status: 404
  end
end
