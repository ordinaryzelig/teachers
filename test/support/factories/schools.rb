module Factories

  module_function

  def piedmont_primary(atts = {})
    atts[:name]        ||= 'Piedmont Primary'
    atts[:address_1]   ||= 'Edmond Rd.'
    atts[:city]        ||= 'Piedmont'
    atts[:postal_code] ||= 'sure'
    atts[:state]       ||= 'OK'
    School.create!(atts)
  end

end
