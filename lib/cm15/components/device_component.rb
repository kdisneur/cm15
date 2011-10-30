require_relative './component'

module Cm15
  module Components
    class DeviceComponent < Component

      attr_accessor :device_code

      def initialize name, house_code, device_code
        super name, house_code
        self.device_code = device_code
      end

      def device_code= device_code
        @device_code = Device_codes[device_code.to_s.to_sym]
        check_device_code!
      end

      def check_device_code
        not @device_code.nil?
      end

      def check_device_code!
        raise "Unit code has not a correct value " unless check_device_code
      end

      def encoded_name
        "#{super}#{@device_code.name}"
      end

      def request action
        function = Function_codes[action]
        raise "Unexpected function on device component" if function.nil? or function.type != :mono
        super action
      end
    end
  end
end

