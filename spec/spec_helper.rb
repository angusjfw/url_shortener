ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require File.join(File.dirname(__FILE__), '..', 'app/app.rb')
require 'helpers/form'

Capybara.app = URLShortener

RSpec.configure do |config|
  config.include FormHelpers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
