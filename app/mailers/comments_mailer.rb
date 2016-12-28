class CommentsMailer < ApplicationMailer

  def teacher_request_comment(comment, user)
    @comment = comment
    mail(
      :to      => user.email,
      :subject => "#{@comment.teacher_request.description.inspect} comment from #{@comment.user.name}"
    )
  end

end
