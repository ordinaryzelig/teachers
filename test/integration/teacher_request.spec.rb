require 'test_helper'

describe 'Teacher request integration' do

  it 'creates TeacherRequest' do
    stephanie = factory!(:stephanie_at_piedmont).teacher
    login_as stephanie

    click_on 'Make a request'

    fill_in 'Description', :with => 'pencils'
    click_on 'Request'

    current_path.must_equal teacher_teacher_request_path(stephanie, stephanie.teacher_requests.last)
    page.must_have_content 'pencils'
  end

end
