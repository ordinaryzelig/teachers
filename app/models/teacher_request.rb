class TeacherRequest < ApplicationRecord

  belongs_to :teaching_position
  has_one :teacher, :through => :teaching_position
  has_many :comments

  validates :description, :presence => true

end
