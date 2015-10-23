# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wanko/version'

Gem::Specification.new do |spec|
  spec.name          = "wanko"
  spec.version       = Wanko::VERSION
  spec.authors       = ["Akira Matsuda"]
  spec.email         = ["ronnie@dio.jp"]

  spec.summary       = 'A safe and rapid prototyping framework for Rails'
  spec.description   = 'Wanko is a Rails Engine framework that can be used for rapid prototyping, feature toggle, or A/B testing'
  spec.homepage      = 'https://github.com/amatsuda/wanko'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'byebug'
end
