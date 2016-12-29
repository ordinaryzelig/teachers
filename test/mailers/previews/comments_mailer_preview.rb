# Preview all emails at http://localhost:3000/rails/mailers/comments_mailer
class CommentsMailerPreview < ActionMailer::Preview

  def teacher_request_comment
    comment = Comment.first
    CommentsMailer.teacher_request_comment(comment, comment.user)
  end

end
