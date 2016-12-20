class TeachingPosition < ApplicationRecord

  belongs_to :teacher, :class_name => 'User'
  belongs_to :school

end
