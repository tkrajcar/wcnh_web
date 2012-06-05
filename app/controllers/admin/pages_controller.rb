class Admin::PagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin!, :only => [:delete]

  def index
    if current_user.admin?
      @pages = Page.all if current_user.admin?
    else
      @pages = Page.where(author: current_user.name)
    end
  end

  def edit
    @page = Page.find(params[:id])
    unless current_user.admin? || current_user.name == @page.author
      flash[:alert] = "Permission denied."
      redirect_to root_path 
    end
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    @page.author = current_user.name
    if @page.save
      redirect_to(page_path(@page.urls.first), :notice => "Page created!")
    else
      render :action => "new"
    end
  end

  def save
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to page_path(@page.urls.first), :notice => "Page edited."
    else
      render :action => "edit"
    end
  end

  def delete
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to admin_pages_path, :notice => "Page successfully deleted."
  end

  def is_admin!
    unless current_user.admin?
      flash[:alert] = "Permission denied."
      redirect_to root_path
    end
  end

end
