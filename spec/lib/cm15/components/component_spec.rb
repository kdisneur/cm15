require File.dirname(__FILE__) + '/../../../spec_helper'

module Cm15::Components
  describe Component do
    
    before(:each) do
      @component = Component.new "My component", :A
    end

    describe "house code" do
      Cm15::Constants::Components::House_codes.each do |key, value|
        it "should be valid with the string key : #{key.to_s}" do
          lambda { Component.new "component_name", key.to_s }.should_not raise_error
        end

        it "should be valid with the symbol key : #{key.to_s}" do
          lambda { Component.new "component_name", key }.should_not raise_error
        end
      end
    
      ["Z", "z", 42].each do |key| 
        it "should raise an exception with the symbol key : #{key.to_s}" do
          lambda { Component.new "component_name", key }.should raise_error
        end
      end
    end

    describe "actions" do
      it "should be valid if the action exists" do
        lambda { @component.request :all_units_off }.should_not raise_error
      end

      it "should raise an exception it the action doesn't exist" do
        lambda { @component.request :unexpected_action }.should raise_error
      end
    end
  end
end 