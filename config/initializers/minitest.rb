# Use .spec.rb pattern to run tests.
# FIXME: rake does not pick this up.
if Rails.env.test?
  Minitest.extensions.unshift << 'rails_spec'
  module Minitest
    def self.plugin_rails_spec_options(opts, options)
      if options[:patterns].empty?
        options[:patterns] << 'test/**/*.spec.rb'
        options[:patterns] << 'test/**/*_test.rb'
      end
    end
  end
end
