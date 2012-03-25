class RP_Vote
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :voter, type: String
  
  embedded_in :item, :class_name => "RP_Item"
end