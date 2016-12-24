require 'test_helper'

describe 'Teacher registration integration' do

  it 'creates TeachingPosition between teacher and existing school' do
    piedmont_primary = factory!(:piedmont_primary)
    stephanie = factory!(:stephanie)
    login_as stephanie

    click_on 'Add school'

    select piedmont_primary.name
    click_on 'Add'

    current_path.must_equal teaching_position_path(stephanie.teaching_positions.last)
    page.must_have_content piedmont_primary.name
  end

end
