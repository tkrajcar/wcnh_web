class PagesController < ApplicationController
  def homepage
  end

  def show
    filename = "temp_content/#{params['name']}.haml"
    raise ActionController::RoutingError.new('Page Not Found') unless File.exists? filename
    render :file => filename
  end
end
