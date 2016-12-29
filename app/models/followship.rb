class Followship < ApplicationRecord

  belongs_to :teacher,   :class_name => 'User'
  belongs_to :supporter, :class_name => 'User'

end
