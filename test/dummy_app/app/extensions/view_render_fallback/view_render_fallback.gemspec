$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "view_render_fallback/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "view_render_fallback"
  s.version     = ViewRenderFallback::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
end
