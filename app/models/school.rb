class School < ApplicationRecord

  has_many :teaching_positions
  has_many :teachers, :through => :teaching_positions, :class_name => 'User'

  validates :name, :presence => true
  validates :address_1, :presence => true
  validates :city, :presence => true
  validates :postal_code, :presence => true
  validates :state, :presence => true

end
