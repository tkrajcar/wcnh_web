class PagesController < ApplicationController
  def homepage
    @events = Event.where(date: DateTime.now..DateTime.now + 30.days).desc(:date)
    @events = Event.all.desc(:date).limit(10) if @events.count < 10

    @headlines = Page.where(urls: "headline-news").first
    
  end

  def show
    url_parameter = params['name'].parameterize
    @page = Page.where(urls: url_parameter).first
    raise ActionController::RoutingError.new('Page Not Found') if @page.nil?

    # 301 redirect to 'proper url', if it isn't what they used
    redirect_to :name => @page.urls[0], :status => 301 if @page.urls[0] != url_parameter
    @sidebars = []
    if !@page.sidebars.nil?
      @page.sidebars.each do |sidebar_url|
        @sidebars << Page.where(urls: sidebar_url).first
      end
    end
  end

  def wanted
   @wanted = Wanted.where(:visible => true).desc 
  end
  
  def rp
    @rpcats = RP_Category.all.desc
  end
end
