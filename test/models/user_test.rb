require 'test_helper'

describe User do

  it 'is created from facebook auth_hash' do
    # from https://github.com/mkdynamic/omniauth-facebook
    auth_hash = {
      provider: 'facebook',
      uid: '1234567',
      info: {
        email: 'joe@bloggs.com',
        name: 'Joe Bloggs',
        image: 'http://graph.facebook.com/1234567/picture?type=square',
        verified: true
      },
      credentials: {
        token: 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
        expires_at: 1321747205, # when the access token expires (it always will)
        expires: true # this will always be true
      },
      extra: {
        raw_info: {
          id: '1234567',
          name: 'Joe Bloggs',
          first_name: 'Joe',
          last_name: 'Bloggs',
          link: 'http://www.facebook.com/jbloggs',
          username: 'jbloggs',
          location: { id: '123456789', name: 'Palo Alto, California' },
          gender: 'male',
          email: 'joe@bloggs.com',
          timezone: -8,
          locale: 'en_US',
          verified: true,
          updated_time: '2011-11-11T06:21:03+0000',
          # ...
        }
      }
    }

    user = User.find_or_create_from_auth_hash(auth_hash)
    user.must_be :persisted?
    user.email.must_equal      'joe@bloggs.com'
    user.first_name.must_equal 'Joe'
    user.last_name.must_equal  'Bloggs'
    user.auth_hash.must_equal  MultiJson.load(auth_hash.to_json)
  end

  it 'is found by facebook auth_hash' do
    user = Factories.stephanie
    user_count = User.count
    auth_hash = {
      :provider => 'facebook',
      :extra => {
        :raw_info => {
          :email => user.email,
        },
      },
    }

    authed_user = User.find_or_create_from_auth_hash(auth_hash)
    User.count.must_equal 1
    authed_user.must_equal user
  end

end
