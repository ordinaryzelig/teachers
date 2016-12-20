class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :teacher_request

end
