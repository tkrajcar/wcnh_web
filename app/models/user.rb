class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  field :name
  field :current_dbref

  validates_presence_of :name, :current_dbref

  validates_uniqueness_of :name, :email, :current_dbref, :case_sensitive => false

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
end
