require 'json'
require_relative 'sports_data_io/internal_error'
require_relative 'sports_data_io/application_service'
require_relative 'sports_data_io/request_builder'
require_relative 'sports_data_io/request_builder/soccer'

class SportsDataIO
  @@api_key = nil

  def self.api_key
    @@api_key ||= ENV['SPORTS_DATA_IO_API_KEY'] 
  
    raise 'API key not set' if @@api_key.nil?

    @@api_key
  end

  def self.api_key=(key)
    @@api_key = key
  end

  def self.request_soccer_info(service_name, find_params = {})
    data = SportsDataIO::Soccer.call(service: service_name, key: api_key, params: find_params)
  end
end
