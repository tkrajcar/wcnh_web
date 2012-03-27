class RP_Category
  include Mongoid::Document
  self.collection_name = 'rp_categories'
  
  field :name, type: String
  field :desc, type: String
  
  has_many :items, :class_name => "RP_Item", :inverse_of => :category
end