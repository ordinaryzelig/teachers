class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :teacher_request

  def users_to_email
    users =  teacher_request.commenters.to_a
    users << teacher_request.teacher
    users.delete user
    users.uniq
  end

end
