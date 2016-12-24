Factories.define(
  :stephanie_at_piedmont,
  :class => TeachingPosition,
  :attributes => -> {
    {
      :teacher => Factories.factory!(:stephanie),
      :school  => Factories.factory!(:piedmont_primary),
    }
  },
)
