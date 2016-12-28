module Factories

  module_function

  def donor(atts = {})
    atts[:first_name] ||= 'Donortello'
    atts[:last_name]  ||= 'Versace'
    atts[:email]      ||= 'donor@versace.com'
    atts[:category]   ||= 'donor'
    User.create!(atts)
  end

end
