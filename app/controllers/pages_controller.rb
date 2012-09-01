class PagesController < ApplicationController
  def homepage
    @events = Event.where(date: DateTime.now..DateTime.now + 30.days).desc(:date)
    @events = Event.all.desc(:date).limit(10) if @events.count < 10

    @headlines = BB_Category.where(:name => 'IC - Enigma Sector News Net').first.posts.where(:parent_id => nil).desc(:created_at).limit(10)
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
    if @cat = RP_Category.where(:name => params[:category]) then
      @rpitems = @cat.first.items.desc(:votes, :created_at) if @cat.count > 0 && params[:category]
    end
  end
  
  def index
    case request.path.split('/').second
    when 'recent_changes'
      @title = 'Recent Changes'
      @pages = Page.all.desc(:updated_at)
    when 'search'
      @title = 'Search Results'
      @pages = Page.where(title: Regexp.new(params[:term], Regexp::IGNORECASE)).asc(:title)
    else
      @title = 'Page Index'
      @pages = Page.all.asc(:title)
    end
  end
end
