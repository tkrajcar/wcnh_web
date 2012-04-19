class BB_Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia # Use paranoia to archive posts that are deleted or timed out.
  
  self.collection_name = 'b_board_posts' 
    
  field :sticky, type: Boolean, :default => false
  field :author, type: String
  field :title, type: String
  field :body, type: String
  field :parent_id, type: String, :default => nil # Posts that are threads belong to a parent post.
  index :parent_id
  
  belongs_to :category, :class_name => "BB_Category", :index => true, :inverse_of => :posts
end