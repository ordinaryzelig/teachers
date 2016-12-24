DatabaseCleaner.strategy = :truncation

class Minitest::Test
  def setup
    super
    DatabaseCleaner.clean
  end
end
