class Event
    include Mongoid::Document
    self.collection_name = 'calendar_events'
    field :num, type: Integer
    index :num, :unique => true
    field :creator, type: String
    field :date, type: DateTime
    field :participants, type: Array
    field :location, type: String
    field :title, type: String
    field :info, type: String
end