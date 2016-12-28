ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

$LOAD_PATH.unshift __dir__
require 'support/minitest'
require 'support/omniauth'
require 'support/factories'
require 'support/database_cleaner'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
