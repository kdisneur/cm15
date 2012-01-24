module Cm15
  module Functions
    include Cm15::Constants::Functions

    def execute_on params
      function = Function_codes[:on]
      switch function, params
    end

    def execute_off params
      function = Function_codes[:off]
      switch function, params
    end

    private

    def switch function, params
      house = params[:house]
      unit  = params[:unit]

      raise "Must have house and unit code to execute '#{function.name}'" if house.nil? or unit.nil?

      device_code   = (house.decimal_value * 16 + unit.decimal_value)
      house_action  = (house.decimal_value * 16 + function.decimal_value)
      usb.connect do |usb|
        usb.send "#{0x04.chr}#{device_code.chr}"
        usb.send "#{0x66.chr}#{house_action.chr}"
      end
    end
  end
end