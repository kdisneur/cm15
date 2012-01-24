module Cm15
  module Functions  
    def execute_status_request params
      function  = Function_codes[:status_request]
      house     = params[:house]
      unit      = params[:unit]

      raise "Must have house and unit code to execute '#{function.name}'" if house.nil? or unit.nil?
                
      house_action  = (house.decimal_value * 16 + 7)    
      unit_action   = (0 * 16 + unit.decimal_value)

      usb.connect do |usb|
        usb.send "#{0x07.chr}#{house_action.chr}#{unit_action.chr}#{0x03.chr}#{0x3b.chr}"
        p usb.send "#{0x07.chr}#{house_action.chr}#{unit_action.chr}#{0x00.chr}#{0x37.chr}"
        p usb.read
      end
    end
  end
end