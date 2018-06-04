# frozen_string_literal: true

ContentfulRails.configure do |config|
  config.access_token = ENV['CONTENTFUL_API_KEY']
  config.preview_access_token = ENV['CONTENTFUL_PREVIEW_API_KEY']
  config.management_token = ENV['CONTENTFUL_MANAGEMENT_API_KEY']
  config.space = ENV['CONTENTFUL_SPACE_ID']
  config.default_locale = 'en-GB'
  config.contentful_options = {
    logger: Rails.logger
  }
end
