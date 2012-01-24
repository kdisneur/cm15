require 'libusb'

module Cm15
  class Usb

    Write_endpoint = 0x02
    Read_endpoint  = 0x81
    Ack            = 0x55.chr
    Waiting        = 0.750

    def connect &block
      @usb_handle = usb_device.open
      @usb_handle.claim_interface(0)
      block.call self
      @usb_handle.release_interface(0)
      @usb_handle.close
    end

    def send data
      @usb_handle.bulk_transfer :endpoint => Usb::Write_endpoint, :dataOut => data
      ack = read 2
      sleep Usb::Waiting
      return Usb::Ack == ack
    end

    def read buffer_size = 256
      data = nil
      begin
        data = @usb_handle.bulk_transfer :endpoint => Usb::Read_endpoint, :dataIn => buffer_size
      rescue LIBUSB::ERROR_TIMEOUT; end      
      return data
    end

    private 

    def usb_device
      @usb    ||= LIBUSB::Context.new
      @device ||= @usb.devices(:idVendor => 0x0bc7, :idProduct => 0x0001).first
    end
  end
end
