class TeacherRequestsMailer < ApplicationMailer

  def created(teacher_request, supporter)
    @teacher_request = TeacherRequest.first
    @supporter = User.donors.first
    mail(
      :to => @supporter.email,
      :subject => "#{@teacher_request.teacher.professional_name} needs #{@teacher_request.title}. Can you help?",
    )
  end

end
