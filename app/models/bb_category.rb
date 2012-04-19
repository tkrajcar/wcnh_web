class BB_Category
  include Mongoid::Document
  
  self.collection_name = 'b_board_categories'
  
  field :num, type: Integer
  field :name, type: String
  field :ansi, type: String, :default => "n" # Ansi string for colorized boards in-game
  field :permission_type, type: String 
  field :permission_value, type: String
  field :anonymous, type: String, :default => nil
  field :timeout, type: Integer, :default => nil # Default timeout in days for posts
  
  has_many :posts, :class_name => "BB_Post", :inverse_of => :category
end