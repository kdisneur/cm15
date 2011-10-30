require_relative './code'
require_relative '../constants'

module Cm15
  module Naming
    class FunctionCode < Code
      attr_reader :type

      include Cm15::Constants::FunctionTypes

      def initialize name, decimal_value, type
        super name, decimal_value
        self.type = type
      end

      def type= type
        @type = type.to_sym
        check_type!
      end

      def check_type
        not @type.nil?
      end

      def check_type!
        raise "Function type has not a correct value " unless check_type
      end

    end
  end
end

