MiniTest::Spec.register_spec_type ActionDispatch::IntegrationTest do |desc|
  desc.superclass == ApplicationController
end

ActionDispatch::IntegrationTest.extend Minitest::Spec::DSL

ActionDispatch::IntegrationTest.include(Module.new do

  def login_as(user)
    OmniAuthTestHelper.mock_auth_hash(user)
    get OmniAuthTestHelper.login_path
    assert_response :redirect
    follow_redirect!
  end

  def teardown
    OmniAuthTestHelper.unmock_auth
    super
  end

end)
