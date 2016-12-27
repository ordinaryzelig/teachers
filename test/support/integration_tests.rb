require 'capybara/rails'

class RequestSpec < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end

require 'support/omniauth'
MiniTest::Spec.register_spec_type /integration$/i, RequestSpec
