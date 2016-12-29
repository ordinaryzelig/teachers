module Factories

  module_function

  def teacher(atts = {})
    atts[:email]      ||= 'teacher@teachers.edu'
    atts[:title]      ||= 'Dr.'
    atts[:first_name] ||= 'Teach'
    atts[:last_name]  ||= 'Er'
    atts[:category]   ||= 'teacher'
    User.create!(atts)
  end

end
