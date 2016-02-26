# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dotgpg/environment/version'
require "English"

Gem::Specification.new do |spec|
  spec.name          = "dotgpg-environment"
  spec.version       = Dotgpg::Environment::VERSION
  spec.authors       = ["jonathan schatz"]
  spec.email         = ["modosc@users.noreply.github.com"]

  spec.summary       = spec.description = "dotenv parser for dotgpg files"
  spec.homepage      = "https://github.com/modosc/dotgpg-environment"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency "dotgpg"
  spec.add_dependency "dotenv", "~> 2.0.1"

end
