module Factories

  module_function

  def stephanie_at_piedmont(atts = {})
    atts[:teacher] ||= Factories.stephanie
    atts[:school]  ||= Factories.piedmont_primary
    TeachingPosition.create!(atts)
  end

end
