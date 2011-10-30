require_relative './device_component'

module Cm15
  module Components
    class Lamp < DeviceComponent

      def light action
        raise "Unexpected light action on lamp device" unless [:on, :off].include? action
        request action
      end

      def light_on
        light :on
      end

      def light_off
        light :off
      end
    end
  end
end

