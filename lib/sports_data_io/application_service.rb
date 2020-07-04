require 'yaml'

class SportsDataIO
  class ApplicationService
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

      raise  InternalError.new("Configuration file is missed") unless File.exists?(path)

      YAML.load(File.read(path))
    end
  end
end
