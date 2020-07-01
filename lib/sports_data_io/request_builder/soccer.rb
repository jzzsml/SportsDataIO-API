class SportsDataIO
  class Soccer < RequestBuilder

    attr_reader :service
    attr_reader :params
    attr_reader :api_key

    def call 
      request_service(matched_service_hash, api_key, params)
    end


    def matched_service_hash
      selected_service = @@loaded_configs[service]

      raise "Method #{service} is not accepted for SportDataIo" unless selected_service.present?

      selected_service
    end
  end
end