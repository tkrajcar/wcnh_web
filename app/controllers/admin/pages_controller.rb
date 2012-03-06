class Admin::PagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin!

  def index
    @pages = Page.all
  end

  def edit
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to(page_path(@page.name), :notice => "Page created!")
    else
      render :action => "new"
    end
  end

  def save
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to page_path(@page.name), :notice => "Page edited."
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
