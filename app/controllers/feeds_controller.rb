class FeedsController < ApplicationController
  def headlines
    @headlines = BB_Category.where(:name => 'IC - Enigma Sector News Net').first.posts.where(:parent_id => nil).desc(:created_at)
  end
  
  def gmemits
    @gmemits = BB_Category.where(:name => 'IC - Galactic Action').first.posts.where(:parent_id => nil).desc(:created_at)
  end
end