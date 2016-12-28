OmniAuth.config.test_mode = true

module OmniAuthTestHelper

  module_function

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

  def unmock_auth
    OmniAuth.config.mock_auth[:facebook] = nil
  end

  def login_path
    '/auth/facebook'
  end

end
