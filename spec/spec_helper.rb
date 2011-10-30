Dir::glob(File.join(File.dirname(__FILE__), "..", "lib", "**", "*.rb")) {|file| require file; }

module Kernel
  def system cmd
    return cmd
  end
end