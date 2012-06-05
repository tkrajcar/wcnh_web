class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  field :name, :type => String
  field :current_dbref, :type => String
  field :admin, :type => Boolean, :default => false

  ## Database authenticatable
  field :email,              :type => String, :null => false
  field :encrypted_password, :type => String, :null => false
  ## Rememberable
  field :remember_created_at, :type => Time
  ## Trackable
  field :sign_in_count,      :type => Integer
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  has_many :created, :class_name => "Page", :inverse_of => :creator # All of the pages created by the user
  has_many :edits, :class_name => "Page", :inverse_of => :editor #All of the user's page edits

  validates_presence_of :name, :current_dbref

  validates_uniqueness_of :name, :email, :current_dbref, :case_sensitive => false

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
end
