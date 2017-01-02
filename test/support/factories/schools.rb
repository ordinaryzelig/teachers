module Factories

  module_function

  def school(atts = {})
    atts[:name]        ||= 'Buzz Astronaut school'
    atts[:address_1]   ||= 'School St.'
    atts[:city]        ||= 'School city'
    atts[:postal_code] ||= 'loohcs'
    atts[:state]       ||= 'SC'
    School.create!(atts)
  end

end
