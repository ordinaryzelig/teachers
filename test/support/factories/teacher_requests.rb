module Factories

  module_function

  def need_frosting(atts = {})
    atts[:teaching_position] ||= Factories.stephanie_at_piedmont
    atts[:description]       ||= 'Need Frosting to make gingerbread houses'
    TeacherRequest.create!(atts)
  end

end
