Rails.application.config.middleware.use OmniAuth::Builder do
  case Rails.env
  when 'development', 'test'
    facebook_key = '730629050427606' # App ID
    facebook_secret = 'eeaf9e5cdf33cfdfc1d76566b7458a15'
  else
    raise "Set ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']"
  end

  options = {
    :info_fields => 'email,first_name,last_name'
  }

  provider :facebook, facebook_key, facebook_secret, options
end
