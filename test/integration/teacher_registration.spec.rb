require 'test_helper'

describe 'Teacher registration integration' do

  it 'creates TeachingPosition between teacher and existing school' do
    piedmont_primary = factory!(:piedmont_primary)
    stephanie = factory!(:stephanie)
    login_as stephanie

    click_on 'Add school'

    fill_in 'teaching_position_school_id', :with => piedmont_primary.id
    click_on 'Add School'

    current_path.must_equal teaching_position_path(stephanie.teaching_positions.last)
    page.must_have_content piedmont_primary.name
  end

end
