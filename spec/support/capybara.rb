Capybara.configure do |config|
  config.match = :prefer_exact
  config.asset_host = "http://#{ENV.fetch('HOST')}"
end
