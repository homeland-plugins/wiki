$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "homeland/wiki/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "homeland-wiki"
  s.version     = Homeland::Wiki::VERSION
  s.authors     = ["Griffin Qiu"]
  s.email       = ["griffinqiu@gmail.com"]
  s.homepage    = "https://github.com/ruby-china/homeland-wiki"
  s.summary     = Homeland::Wiki::DESCRIPTION
  s.description = Homeland::Wiki::DESCRIPTION
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5"
end

