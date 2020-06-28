require 'json'
require 'ostruct'

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
end
