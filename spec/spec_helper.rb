ENV["RAILS_ENV"] ||= "test"

require "spec_base_helper"
require File.expand_path("../../config/environment", __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "rspec/rails"
require "shoulda/matchers"

REQUIRED_PATHS = [
  "spec/support/**/*.rb",
  "spec/system/support/helpers/**/*.rb",
  "spec/system/support/*.rb",
  "spec/system/support/{section,shared}/**/*.rb",
  "spec/system/support/pages/**/*.rb"
].freeze

REQUIRED_PATHS.each do |path|
  Dir[Rails.root.join(path)].each { |f| require f }
end

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
