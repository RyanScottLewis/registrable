require 'bundler/setup'
require 'registrable'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

ENV['RSPEC'] = 'true'

Dir["#{__dir__}/support/**/*.rb"].each { |path| require(path) }
Dir["#{__dir__}/../examples/**/*.rb"].each { |path| require(path) }
