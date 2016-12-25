class School < ApplicationRecord

  has_many :teaching_positions
  has_many :teachers, :through => :teaching_positions, :class_name => 'User'

  validates :name, :presence => true

end
