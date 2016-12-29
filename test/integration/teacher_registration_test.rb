require 'test_helper'

describe 'Teacher registration integration' do

  it 'creates TeachingPosition between teacher and existing school' do
    school = Factories.school
    teacher = Factories.teacher
    login_as teacher

    click_on 'Add school'

    # User would set by using auto-complete, but we are skipping that step here.
    school_id_field = find '#teaching_position_school_id', :visible => false
    school_id_field.set school.id
    click_on 'Add School'

    current_path.must_equal teaching_position_path(teacher.teaching_positions.last)
    page.must_have_content school.name
  end

end
