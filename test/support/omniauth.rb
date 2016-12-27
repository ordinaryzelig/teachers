OmniAuth.config.test_mode = true

RequestSpec.include(Module.new do

  def login_as(user)
    mock_auth_hash(user)
    visit '/auth/facebook'
  end

  def teardown
    OmniAuth.config.mock_auth[:facebook] = nil
  end

private

  def mock_auth_hash(user)
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      :provider => 'facebook',
      :extra => {
        :raw_info => {
          :email => user.email,
        },
      },
    })
  end

end)
