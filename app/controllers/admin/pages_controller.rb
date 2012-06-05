class Admin::PagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin!, :only => [:delete]

  def index
    if current_user.admin?
      @pages = Page.all
    else
      @pages = Page.where(creator_id: current_user.id)
    end
  end

  def edit
    @page = Page.find(params[:id])
    unless current_user.admin? || current_user == @page.creator
      flash[:alert] = "Permission denied."
      redirect_to root_path 
    end
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.valid?
      @page.creator = current_user
      @page.editor = current_user
      @page.save
      redirect_to(page_path(@page.urls.first), :notice => "Page created!")
    else
      render :action => "new"
    end
  end

  def save
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      @page.editor = current_user
      @page.save
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
