require 'open-uri'

class SportsDataIO
  class RequestBuilder < ApplicationService

    attr_reader :service
    attr_reader :params
    attr_reader :key

    def call 
      request_service(matched_service_hash, params)
    end

    def request_service(service_hash, search_params = {})
      wrong_params_message(service_hash) unless search_params_valid?(service_hash, search_params)

      url = constructed_url(service_hash, search_params)
      response = open(url).read

      JSON.parse(response)
    end

    def matched_service_hash
      selected_service = @@loaded_configs[service.downcase]

      raise "Method #{service} is not supported by SportDataIo" if selected_service.nil?

      selected_service
    end

    def constructed_url(service_hash, search_params = {})
      scope = service_hash['scope']
      method = service_hash['method']
      
      constructed_params(service_hash, search_params = {})

      url = "https://api.sportsdata.io/v3/#{@class_name}/#{scope}/json/#{method}#{constructed_params}?key=#{key}"
      puts url
      url
    end

    def constructed_params(valid_params, search_params = {})
      return nil if valid_params.nil?
      valid_params.dig(1, 'name')
      valid_params.dig(2, 'name')
      valid_params.dig(3, 'name')
    end

    def search_params_valid?(service_hash, search_params)
      return true if service_hash['params'].nil?

      raise 'Serch params must be a Hash' unless search_params.is_a?(Hash)

      service_hash['params'].all? do |param, value|
        search_params.keys.include?(value["name"].to_sym)
      end
    end

    def wrong_params_message(service_hash)
      return if service_hash['params'].nil?

      serch_params = ''
      service_hash['params'].each { |param, value| serch_params += "#{value["name"]}: #{value["format"]}, " }
      error_text = "Method '#{service_hash['method']}' is required next search params: { #{serch_params[0...-2]} }"

      raise error_text
    end
  end
end
