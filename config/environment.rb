# Load the rails application
require File.expand_path('../application', __FILE__)

# Load lib/extensions.rb for some custom class stuff
require 'extensions'

# Initialize the rails application
WcnhWeb::Application.initialize!
