# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'motorhead/version'

Gem::Specification.new do |spec|
  spec.name          = "motorhead"
  spec.version       = Motorhead::VERSION
  spec.authors       = ["Akira Matsuda"]
  spec.email         = ["ronnie@dio.jp"]

  spec.summary       = 'A safe and rapid prototyping framework for Rails'
  spec.description   = 'Motorhead is a Rails Engine framework that can be used for rapid prototyping, feature toggle, or A/B testing'
  spec.homepage      = 'https://github.com/amatsuda/motorhead'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency "minitest"
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'byebug'
end
