module Factories

  module_function

  def need_frosting(atts = {})
    atts[:teaching_position] ||= Factory.teaching_position
    atts[:description] = 'Need Frosting to make gingerbread houses'
    TeacherRequest.create!(atts)
  end

end
