RSpec.configure do |config|
  config.before(:each, cache: true) do
    Rails.cache.clear
  end
  
  config.after(:each, preview: true) do
    ContentfulModel.use_preview_api = false
  end
end
