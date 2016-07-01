$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "redirector/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "redirector"
  s.version     = Redirector::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'rails'

  s.add_development_dependency "sqlite3"
end
