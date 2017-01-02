require 'test_helper'

describe 'User registration integration' do

  it 'asks Teacher to choose category, confirm/add information' do
    school = Factories.school
    user = Factories.user
    login_as user

    page.must_have_content 'Are you here as an educator'
    click_on 'Yes'

    page.must_have_content 'Find your school'
    # User would set by using auto-complete, but we are skipping that step here.
    school_id_field = find '#teaching_position_school_id', :visible => false
    school_id_field.set school.id
    click_on 'Add School'

    page.must_have_content 'Please confirm your information'
    select 'Mrs.'
    click_on 'Save'

    user.reload
    page.current_path.must_equal dashboard_path
    page.must_have_content school.name
    page.must_have_content user.professional_name
  end

end
