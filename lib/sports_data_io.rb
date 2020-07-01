require 'json'
require 'ostruct'
require 'sports_data_io/request_builder.rb'
require 'sports_data_io/soccer.rb'

class SportsDataIO
  @@api_key = nil

  def self.api_key
    @@api_key ||= ENV['SPORTS_DATA_IO_API_KEY'] 
    @@api_key ||= Rails.application.credentials.dig(:sportsdata_io, :api_key)
  
    raise 'API key not set' if @@api_key.nil?

    @@api_key
  end

  def self.api_key=(key)
    @@api_key = key
  end

  def self.request_soccer_info(service_name, find_params)
    data = SportsDataIO::Soccer.call(service: service_name, api_key: @@api_key, params: find_params)
  end
end
