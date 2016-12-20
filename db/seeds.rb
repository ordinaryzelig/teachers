piedmont_primary = School.create!(
  :name => 'Piedmont Primary',
  :address_1 => 'Edmond Rd.',
  :city => 'Piedmont',
  :postal_code => 'sure',
  :state => 'OK',
)

stephanie = User.create!(
  :first_name => 'Stephanie',
  :last_name => 'Adler',
  :category => 'teacher',
)

stephanie.schools << piedmont_primary
