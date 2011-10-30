require File.dirname(__FILE__) + '/../../../spec_helper'

module Cm15::Components
  describe Lamp do

    before(:each) do
      @lamp = Lamp.new "bedroom", "A", 1
    end

    describe "light naming" do
      Cm15::Constants::Components::House_codes.each do |house_key, house_value|
        Cm15::Constants::Components::Device_codes.each do |device_key, device_value|
          it "should be valid if its house code is #{house_key} and its device code is #{device_key}" do      
            lambda { Lamp.new "Bedroom", house_key, device_key }.should_not raise_error
          end
        end
      end

      [ "z", 42 ].each do |house_key|
        [ -5, 1337 ].each do |device_key|
          it "should raise an exception if its house code is #{house_key} and its device code is #{device_key}" do
            lambda { Lamp.new "Bedroom", house_key, device_key }.should raise_error
          end
        end
      end
    end

    describe "switch lighting" do    
      it "should be able to turn on the lamp" do
        @lamp.light_on.should be == "cm15a A1 on"
        @lamp.light(:on).should be == "cm15a A1 on"
      end

      it "should be able to turn off the lamp" do
        @lamp.light_off.should be == "cm15a A1 off"
        @lamp.light(:off).should be == "cm15a A1 off"
      end

      ["unexpected_action", :unexpected_action, 1337].each do |action|
        it "should raise an exception if we call an unexpected action on light" do
          lambda { @lamp.light action }.should raise_error
        end
      end
    end
  end
end