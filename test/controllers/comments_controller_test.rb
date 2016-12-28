require 'test_helper'

describe CommentsController do

  include ActiveJob::TestHelper

  it 'sends an email to the teacher when a donor comments on their TeacherRequest' do
    need_frosting = Factories.need_frosting
    teacher       = need_frosting.teacher
    donor         = Factories.donor
    login_as donor

    perform_enqueued_jobs do
      params = {
        :comment => {
          :teacher_request_id => need_frosting.id,
          :body               => 'I have tons extra',
        },
      }
      post comments_path, :params => params
    end

    ActionMailer::Base.deliveries.size.must_equal 1
    email = ActionMailer::Base.deliveries.first
    email.to.must_equal [teacher.email]
    email.subject.must_equal %Q{"#{need_frosting.description}" comment from #{donor.name}}
  end

end
