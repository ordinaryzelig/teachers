Factories.define(
  :stephanie,
  :class => User,
  :attributes => {
    :first_name => 'Stephanie',
    :last_name  => 'Adler',
    :category   => 'teacher',
  },
)

Factories.define(
  :piedmont_primary,
  :class => School,
  :attributes => {
    :name        => 'Piedmont Primary',
    :address_1   => 'Edmond Rd.',
    :city        => 'Piedmont',
    :postal_code => 'sure',
    :state       => 'OK',
  },
)
