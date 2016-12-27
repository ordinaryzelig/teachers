require 'test_helper'

describe 'Teacher request integration' do

  it 'lets a teacher create a TeacherRequest' do
    stephanie = Factories.stephanie_at_piedmont.teacher
    login_as stephanie
    click_on 'Make a request'

    fill_in 'Description', :with => 'pencils'
    click_on 'Request'

    current_path.must_equal teacher_request_path(stephanie.teacher_requests.last)
    page.must_have_content 'pencils'
  end

  it 'allows comments' do
    at_piedmont = Factories.stephanie_at_piedmont
    need_frosting = Factories.need_frosting(:teaching_position => at_piedmont)
    stephanie = at_piedmont.teacher
    login_as stephanie

    visit teacher_request_path(need_frosting)
    comment = 'Bonus for ones with sprinkles!'
    fill_in 'Comment', :with => comment
    click_on 'Add comment'

    current_path.must_equal teacher_request_path(need_frosting)
    page.must_have_content comment
  end

end
