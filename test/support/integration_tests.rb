require 'capybara/rails'

class RequestSpec < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL

  def login_as(user)
    visit new_session_path
    fill_in 'Id', :with => user.id
    click_on 'Log in'
  end
end

MiniTest::Spec.register_spec_type /integration$/i, RequestSpec
