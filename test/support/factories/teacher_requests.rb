module Factories

  module_function

  def teacher_request(atts = {})
    atts[:teaching_position] ||= Factories.teaching_position
    atts[:description]       ||= 'Need something'
    TeacherRequest.create!(atts)
  end

end
