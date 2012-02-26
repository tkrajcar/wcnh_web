class Wanted
    include Mongoid::Document
    include Mongoid::Timestamps
    self.collection_name = 'dossier_wanteds'

    identity :type => String # dbref
    field :name, :type => String # we store the name because a player might re-@name to avoid a bounty.
    field :amount, :type => Integer, :default => 0
    field :info, :type => String, :default => ""
    field :contact, :type => String, :default => ""
    field :visible, :type => Boolean, :default => false
end