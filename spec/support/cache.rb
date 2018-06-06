RSpec.configure do |config|
  config.after(:each, cache: true) do
    Rails.cache.clear
  end
end
