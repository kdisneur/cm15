module Cm15
  def self.request action, device
    executable = "cm15a"
    system "#{executable} #{device} #{action}"
  end
end

