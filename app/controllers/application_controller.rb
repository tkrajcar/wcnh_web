class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_404
    if /(jpe?g|png|gif)/i === request.path
      render :text => "404 Not Found", :status => 404
    else
      render :template => "pages/missingpage", :status => 404
    end
  end
end
