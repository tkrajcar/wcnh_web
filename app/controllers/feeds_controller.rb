class FeedsController < ApplicationController
  def headlines
    @headlines = BB_Category.where(:name => 'IC - Enigma Sector News Net').first.posts.where(:parent_id => nil).desc(:created_at)
  end
  
  def show
    @post = BB_Post.find(params[:id])
  end
  
  def gmemits
    @gmemits = BB_Category.where(:name => 'IC - Galactic Action').first.posts.where(:parent_id => nil).desc(:created_at)
  end
  
  def announcements
    @announcements = BB_Category.where(:name => 'Game Announcements').first.posts.where(:parent_id => nil).desc(:created_at)
  end
  
  def contracts
    @contracts = BB_Category.where(:name => 'IC - Enigma Sector Procurement').first.posts.where(:parent_id => nil).desc(:created_at)
  end
end
