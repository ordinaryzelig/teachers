require_relative 'schools_import'

stephanie = User.create!(
  :first_name => 'Stephanie',
  :last_name  => 'Adler',
  :email      => 'stephanie@adler.com',
  :category   => 'teacher',
)

piedmont_primary = School.where(:name => 'Piedmont Primary Es').first!
stephanie.schools << piedmont_primary
