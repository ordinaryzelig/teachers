OmniAuth.config.test_mode = true

# You don't need to use this directly.
# Controller test and Integration test use it with `login_as`.
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
