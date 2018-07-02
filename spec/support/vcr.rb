require 'vcr'

dotenv = Rails.root.join('.env')
filter_vars = File.exist?(dotenv) ? Dotenv::Environment.new(dotenv, true) : ENV

VCR.configure do |c|
  c.hook_into :webmock
  c.ignore_localhost = true
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.configure_rspec_metadata!
  c.default_cassette_options = {
    record: ENV['VCR_RECORD'] ? ENV['VCR_RECORD'].to_sym : :none
  }
  filter_vars.each do |key, value|
    c.filter_sensitive_data("<#{key}>") { value }
  end
  c.filter_sensitive_data('<TWITTER_BASIC_AUTH>') do
    Base64.strict_encode64("#{ENV.fetch('TWITTER_CONSUMER_KEY')}:#{ENV.fetch('TWITTER_CONSUMER_SECRET')}").chomp
  end
end
