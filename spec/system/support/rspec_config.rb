RSpec.configure do |config|
  config.with_options(type: :feature) do |feature|
    feature.include PageHelpers
  end
end
