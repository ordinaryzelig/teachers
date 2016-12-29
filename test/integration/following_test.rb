require 'test_helper'

describe 'Following integration' do

  it 'is created by a User wanting to follow a Teacher' do
    donor = Factories.donor
    teacher = Factories.teacher
    login_as donor

    visit teacher_path(teacher)
    click_on 'Support'

    page.must_have_content 'You are a supporter'
  end

end
