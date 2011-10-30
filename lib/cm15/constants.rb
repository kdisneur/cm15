require_relative './naming/code'

module Cm15
  module Constants
    module Components
      House_codes = {
        :M => Cm15::Naming::Code.new('M', 0),
        :E => Cm15::Naming::Code.new('E', 1),
        :C => Cm15::Naming::Code.new('C', 2),
        :K => Cm15::Naming::Code.new('K', 3),
        :O => Cm15::Naming::Code.new('O', 4),
        :G => Cm15::Naming::Code.new('G', 5),
        :A => Cm15::Naming::Code.new('A', 6),
        :I => Cm15::Naming::Code.new('I', 7),
        :N => Cm15::Naming::Code.new('N', 8),
        :F => Cm15::Naming::Code.new('F', 9),
        :D => Cm15::Naming::Code.new('D', 10),
        :L => Cm15::Naming::Code.new('L', 11),
        :P => Cm15::Naming::Code.new('P', 12),
        :H => Cm15::Naming::Code.new('H', 13),
        :B => Cm15::Naming::Code.new('B', 14),
        :J => Cm15::Naming::Code.new('J', 15),
      }

      Device_codes = {
        :"13" => Cm15::Naming::Code.new("13", 0),
        :"5" => Cm15::Naming::Code.new("5", 1),
        :"3" => Cm15::Naming::Code.new("3", 2),
        :"11" => Cm15::Naming::Code.new("11", 3),
        :"15" => Cm15::Naming::Code.new("15", 4),
        :"7" => Cm15::Naming::Code.new("7", 5),
        :"1" => Cm15::Naming::Code.new("1", 6),
        :"9" => Cm15::Naming::Code.new("9", 7),
        :"14" => Cm15::Naming::Code.new("14", 8),
        :"6" => Cm15::Naming::Code.new("6", 9),
        :"4" => Cm15::Naming::Code.new("4", 10),
        :"12" => Cm15::Naming::Code.new("12", 11),
        :"16" => Cm15::Naming::Code.new("16", 12),
        :"8" => Cm15::Naming::Code.new("8", 13),
        :"2" => Cm15::Naming::Code.new("2", 14),
        :"10" => Cm15::Naming::Code.new("10", 15),
      }
    end

    module FunctionTypes
      Function_types = {
        :mono => nil,
        :multi => nil,
      }
    end

    module Functions
      require_relative './naming/function_code'

      Function_codes = {
        :all_units_off => Cm15::Naming::FunctionCode.new('all units off', 0, :multi ),
        :all_lights_on => Cm15::Naming::FunctionCode.new('all lights on', 1, :multi),
        :on => Cm15::Naming::FunctionCode.new('on', 2, :mono),
        :off => Cm15::Naming::FunctionCode.new('off', 3, :mono),
        :dim => Cm15::Naming::FunctionCode.new('dim', 4, :mono),
        :bright => Cm15::Naming::FunctionCode.new('bright', 5, :mono),
        :all_lights_off => Cm15::Naming::FunctionCode.new('all light off', 6, :multi),
        :extended_code => Cm15::Naming::FunctionCode.new('extended code', 7, :mono),
        :hail_request => Cm15::Naming::FunctionCode.new('hail request', 8, :mono),
        :hail_acknowledge => Cm15::Naming::FunctionCode.new('hail acknowledge', 9, :mono),
        :preset_dim_1 => Cm15::Naming::FunctionCode.new('preset dim 1', 10, :mono),
        :preset_dim_2 => Cm15::Naming::FunctionCode.new('preset dim 2', 11, :mono),
        :extended_data_transfer => Cm15::Naming::FunctionCode.new('extended data transfer', 12, :mono),
        :status_on => Cm15::Naming::FunctionCode.new('status on', 13, :mono),
        :status_off => Cm15::Naming::FunctionCode.new('status off', 14, :mono),
        :status_request => Cm15::Naming::FunctionCode.new('status request', 15, :mono),
      }
    end
  end
end

