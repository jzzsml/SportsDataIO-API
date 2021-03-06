require 'rubygems'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "vcr/cassettes"
  c.hook_into :webmock
  c.filter_sensitive_data('APIKEY') { ENV['SPORTS_DATA_IO_API_KEY'] }
  c.default_cassette_options = { record: :new_episodes }
  c.configure_rspec_metadata!
end

