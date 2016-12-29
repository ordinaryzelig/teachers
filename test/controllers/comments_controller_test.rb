require 'test_helper'

describe CommentsController do

  include ActiveJob::TestHelper

  it 'sends an email to the teacher when a donor comments on their TeacherRequest' do
    teacher_request = Factories.teacher_request
    teacher       = teacher_request.teacher
    donor         = Factories.donor
    login_as donor

    perform_enqueued_jobs do
      params = {
        :comment => {
          :teacher_request_id => teacher_request.id,
          :body               => 'I have tons extra',
        },
      }
      post comments_path, :params => params
    end

    ActionMailer::Base.deliveries.size.must_equal 1
    email = ActionMailer::Base.deliveries.first
    email.to.must_equal [teacher.email]
    email.subject.must_equal %Q{"#{teacher_request.description}" comment from #{donor.name}}
  end

end
