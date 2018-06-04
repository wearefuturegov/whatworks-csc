# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

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

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
