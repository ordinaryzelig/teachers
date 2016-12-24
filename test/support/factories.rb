module Factories

  module_function

  def all
    @all ||= {}
  end

  def define(name, details)
    all[name] = details
  end

  def find(name)
    all.fetch(name) do
      raise "Factory #{name.inspect} not found"
    end
  end

  module TestCaseMethods

    def factory!(name)
      factory = Factories.find(name)
      factory[:class].create!(factory[:attributes])
    end

  end

end

Minitest::Test.include(Factories::TestCaseMethods)
Dir.glob(__dir__ + '/factories/**/*.rb').each(&method(:require))
