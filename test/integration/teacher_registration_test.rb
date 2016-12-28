require 'test_helper'

describe 'Teacher registration integration' do

  it 'creates TeachingPosition between teacher and existing school' do
    piedmont_primary = Factories.piedmont_primary
    stephanie = Factories.stephanie
    login_as stephanie

    click_on 'Add school'

    # User would set by using auto-complete, but we are skipping that step here.
    school_id_field = find '#teaching_position_school_id', :visible => false
    school_id_field.set piedmont_primary.id
    click_on 'Add School'

    current_path.must_equal teaching_position_path(stephanie.teaching_positions.last)
    page.must_have_content piedmont_primary.name
  end

end
