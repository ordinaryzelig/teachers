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
      attributes = factory[:attributes]
      if attributes.respond_to?(:call)
        attributes = attributes.()
      end
      factory[:class].create!(attributes)
    end

  end

  extend TestCaseMethods

end

Minitest::Test.include(Factories::TestCaseMethods)
Dir.glob(__dir__ + '/factories/**/*.rb').each(&method(:require))
