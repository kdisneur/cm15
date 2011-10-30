require_relative '../cm15'
require_relative '../constants'

module Cm15
  module Components
    class Component

      include Cm15::Constants::Components
      include Cm15::Constants::Functions

      attr_accessor :name, :house_code

      def initialize name, house_code
        @name = name
        self.house_code = house_code
      end

      def house_code= house_code
        house_code = house_code.upcase.to_sym if house_code.instance_of? String
        @house_code = House_codes[house_code]
        check_house_code!
      end

      def check_house_code
        not @house_code.nil?
      end

      def check_house_code!
        raise "House code has not a correct value " unless check_house_code
      end

      def encoded_name
        @house_code.name
      end

      def request action
        function = Function_codes[action]
        raise "Unexpected function value" if function.nil?
        Cm15::request function.name, encoded_name
      end
    end
  end
end

