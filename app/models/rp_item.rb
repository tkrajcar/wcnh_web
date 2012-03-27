class RP_Item
  include Mongoid::Document
  include Mongoid::Timestamps
  self.collection_name = 'rp_items'
  
  field :num, type: Integer
  index :num, :unique => true
  field :title, type: String
  field :info, type: String
  field :creator, type: String
  field :sticky, type: Boolean, :default => false
  
  belongs_to :category, :class_name => "RP_Category", :inverse_of => :items
  embeds_many :votes, :class_name => "RP_Vote"
end



