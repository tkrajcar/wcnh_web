class PagesController < ApplicationController
  def homepage
    @events = Event.where(date: DateTime.now..DateTime.now + 30.days)
    @events = Event.all.to_a.last(10) if @events.count < 10
  end

  def show
    filename = "temp_content/#{params['name']}.haml"
    raise ActionController::RoutingError.new('Page Not Found') unless File.exists? filename
    render :file => filename
  end
end
