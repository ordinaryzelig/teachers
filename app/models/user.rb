class User < ApplicationRecord

  has_many :comments
  has_many :teaching_positions, :foreign_key => :teacher_id
  has_many :schools, :through => :teaching_positions
  has_many :teacher_requests

  CATEGORIES = %w[
    teacher
    donor
  ]

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :category, :inclusion => {:in => CATEGORIES}

  def name
    [first_name, last_name].compact.join(' ')
  end

  CATEGORIES.each do |cat|
    define_method "#{cat}?" do
      category == cat
    end
  end

end
