class TeacherRequestsMailerPreview < ActionMailer::Preview

  def created
    teacher_request = TeacherRequest.first!
    supporter       = User.donors.first!
    TeacherRequestsMailer.created(teacher_request, supporter)
  end

end
