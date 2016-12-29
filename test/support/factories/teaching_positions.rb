module Factories

  module_function

  def teaching_position(atts = {})
    atts[:teacher] ||= Factories.teacher
    atts[:school]  ||= Factories.school
    TeachingPosition.create!(atts)
  end

end
