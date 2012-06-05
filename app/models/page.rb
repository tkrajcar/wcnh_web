class Page
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Versioning

  max_versions 20

  field :title, :type => String
  field :text, :type => String
  field :urls, :type => Array
  field :sidebars, :type => Array

  belongs_to :creator, :class_name => "User" # Original creator
  belongs_to :editor, :class_name => "User" # Most recent editor

  def to_html
    RDiscount.new(self.text).to_html
  end

  before_save :set_url

  def set_url
    new_url = title.parameterize
    if self.urls.nil? || self.urls.length == 0
      self.urls = [new_url]
    else
      self.urls.insert(0, new_url) unless self.urls.include? new_url 
    end
  end
end
