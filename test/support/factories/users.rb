module Factories

  module_function

  def user(atts = {})
    atts[:first_name] ||= 'First'
    atts[:last_name]  ||= 'Last'
    atts[:email]      ||= 'first@last.com'
    User.create!(atts)
  end

end
