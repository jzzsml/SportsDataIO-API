require 'open-uri'
require 'yaml'

class SportsDataIO
  class RequestBuilder
    def self.call(*args, &block)
      new(*args, &block).call
    end

    def initialize(attrs = {})
      attrs.each do |attr, value|
        self.instance_variable_set("@#{attr}", value)
      end
      @class_name = self.class.to_s.downcase.split("::").last
      @@loaded_configs ||= load_config

    end

    def load_config
      path = "./sports_data_io/configs/#{@class_name}_methods.yml"

      raise  "Configuration file is missed" unless File.exists?(path)

      YAML.load(File.read(path))
    end

    def constructed_url(service_hash, api_key, find_params = {})
      find_params = '/' + find_params.to_s if find_params.present?

      scope = service_hash[:scope]
      method = service_hash[:method]
      valid_params = service_hash[:params]

      "https://api.sportsdata.io/v3/#{@class_name}/#{scope}/json/#{method}#{find_params}?key=#{api_key}"
    end

    def request_service(service_hash, api_key, find_params = {})
      url = constructed_url(service_hash, api_key, find_params)
      response = open(url).read

      JSON.parse(response)
    end
  end
end
