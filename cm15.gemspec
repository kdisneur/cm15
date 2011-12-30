$:.push File.expand_path("../lib", __FILE__)

version = File.read(File.expand_path("../VERSION",__FILE__)).strip

Gem::Specification.new do |s|
  s.name        = "cm15"
  s.version     = version
  s.authors     = ["Kevin Disneur"]
  s.email       = ["kevin.disneur@gmail.com"]
  s.homepage    = "https://github.com/kdisneur/cm15"
  s.summary     = "You can access to your cm15 module and send him actions"
  s.description = "You can access to your cm15 module and send him actions"
  s.files = Dir["lib/**/*"] + ["README.rdoc"]
end
