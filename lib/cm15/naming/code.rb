module Cm15
  module Naming
    class Code
      attr_reader :name, :decimal_value

      def initialize name, decimal_value
        @name = name
        @decimal_value = decimal_value
      end

      def binary_value
        decimal_value.to_s 2
      end

      def hexadecimal_value
        decimal_value.to_s 16
      end
    end
  end
end

