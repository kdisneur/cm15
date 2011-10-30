require File.dirname(__FILE__) + '/../../../spec_helper'

module Cm15::Components
  describe DeviceComponent do

    before(:each) do
      @device = DeviceComponent.new "My device", :A, 1
    end
    
    describe "device code" do

      Cm15::Constants::Components::Device_codes.each do |key, value|
        it "should be valid with the string key : #{key.to_s}" do
          lambda { DeviceComponent.new "device_component_name", :A, key.to_s }.should_not raise_error
        end

        it "should be valid with the symbol key : #{key.to_s}" do
          lambda { DeviceComponent.new "device_component_name", :A, key }.should_not raise_error
        end
      end
    
      ["Z", "z", 42].each do |key| 
        it "should raise an exception with the symbol key : #{key.to_s}" do
          lambda { DeviceComponent.new "device_component_name", :A, key }.should raise_error
        end
      end
    end

    describe "actions" do
      it "should be valid if its an mono device action" do
        lambda { @device.request :off }.should_not raise_error
      end

      it "should raise an exception if its an multi device action" do
        lambda { @device.request :all_lights_off }.should raise_error
      end
    end
  end
 end
