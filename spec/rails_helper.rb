# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require 'support/contentful_cleaner'

require File.expand_path('../config/environment', __dir__)

# Remove the ActiveRecord constant, because it is autloaded by
# ActiveStorage and not needed for our application. The presence
# of the ActiveRecord constant causes rspec-rails to include
# extra fixture support, which results in:
#
#   ActiveRecord::ConnectionNotEstablished:
#     No connection pool with 'primary' found.
#
Object.send(:remove_const, :ActiveRecord)

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'webmock/rspec'
require 'timecop'
require 'email_spec'
require 'email_spec/rspec'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  
  config.after(:each, timecop: true) do
    Timecop.return
  end
  
  config.after(contentful: true) do
    Contentful::Cleaner.instance.objects_to_delete.reject! do |i|
      if i.published?
        i.unpublish
      else
        begin
          i.destroy
        rescue Contentful::Management::BadRequest
          i.unpublish
          i.destroy
        end
      end
      true
    end
  end
end
