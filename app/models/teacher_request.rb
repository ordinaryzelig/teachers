class TeacherRequest < ApplicationRecord

  belongs_to :teaching_position
  has_one :teacher, :through => :teaching_position
  has_many :comments
  has_many :commenters, :through => :comments, :source => :user

  validates :title, :presence => true
  validates :description, :presence => true

  def close!
    touch(:closed_at)
  end

end
