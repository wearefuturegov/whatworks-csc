# frozen_string_literal: true

require 'rails_helper'
require 'support/turnip_formatter'

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  config.filter_run_excluding pending: true
end

Dir.glob('spec/features/steps/**/*steps.rb') { |f| load f, true }
