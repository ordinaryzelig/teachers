class CommentsMailer < ApplicationMailer

  def teacher_request_comment(comment, teacher_request)
    @comment         = comment
    @teacher_request = teacher_request
    mail(
      :to      => @teacher_request.teacher.email,
      :subject => "#{@teacher_request.description.inspect} comment from #{@comment.user.name}"
    )
  end

end
