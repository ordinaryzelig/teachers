module Factories

  module_function

  def stephanie(atts = {})
    atts[:first_name] ||= 'Stephanie'
    atts[:last_name]  ||= 'Adler'
    User.create!(
      atts.merge(
        :category => 'teacher',
      )
    )
  end

end
