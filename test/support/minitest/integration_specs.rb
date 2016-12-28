require 'capybara/rails'

class IntegrationSpec < MiniTest::Spec

  include Rails.application.routes.url_helpers
  include Capybara::DSL

  def login_as(user)
    OmniAuthTestHelper.mock_auth_hash(user)
    visit OmniAuthTestHelper.login_path
  end

  def teardown
    OmniAuthTestHelper.unmock_auth
    super
  end

end

require 'support/omniauth'
MiniTest::Spec.register_spec_type /integration$/i, IntegrationSpec
