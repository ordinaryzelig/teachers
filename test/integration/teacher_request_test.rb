require 'test_helper'

describe 'Teacher request integration' do

  it 'lets a teacher create a TeacherRequest' do
    teacher = Factories.teaching_position.teacher
    login_as teacher

    click_on 'Make a request'
    fill_in 'Description', :with => 'pencils'
    click_on 'Request'

    current_path.must_equal teacher_request_path(teacher.teacher_requests.last)
    page.must_have_content 'pencils'
  end

  it 'allows comments' do
    teaching_position = Factories.teaching_position
    teacher_request = Factories.teacher_request(:teaching_position => teaching_position)
    teacher = teaching_position.teacher
    login_as teacher

    visit teacher_request_path(teacher_request)
    comment = 'Bonus for ones with sprinkles!'
    fill_in 'Comment', :with => comment
    click_on 'Add comment'

    current_path.must_equal teacher_request_path(teacher_request)
    page.must_have_content comment
  end

  it 'can be marked as closed/fulfilled by the Teacher' do
    teaching_position = Factories.teaching_position
    teacher_request = Factories.teacher_request(:teaching_position => teaching_position)
    teacher = teaching_position.teacher
    login_as teacher

    visit teacher_request_path(teacher_request)
    click_on 'Edit'
    click_on 'Close request'

    current_path.must_equal teacher_request_path(teacher_request)
    page.must_have_content "Closed on #{Date.current.to_s(:short)}"
  end

end
