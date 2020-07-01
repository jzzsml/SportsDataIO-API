require 'open-uri'

class SportsDataIO
  class RequestBuilder
    def self.call(*args, &block)
      new(*args, &block).call
    end

    def initialize(attrs = {})
      attrs.each do |attr, value|
        self.instance_variable_set("@#{attr}", value)
      end
    end

    def constructed_url(service, api_key, find_params = {})
      find_params = '/' + find_params.to_s if find_params.present?

      "https://api.sportsdata.io/v3/#{selected_sport}/json/#{service}#{find_params}?key=#{api_key}"
    end

    def request_service(service, api_key, find_params = {})
      url = constructed_url(service, api_key, find_params)
      response = open(url).read

      JSON.parse(response)
    end

    def selected_sport
      raise 'Not implemented method'
    end
  end
end
