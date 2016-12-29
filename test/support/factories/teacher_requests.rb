module Factories

  module_function

  def teacher_request(atts = {})
    atts[:teaching_position] ||= Factories.teaching_position
    atts[:title]             ||= 'Pencils'
    atts[:description]       ||= 'No. 2 only, please.'
    TeacherRequest.create!(atts)
  end

end
