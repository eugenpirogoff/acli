# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acli/version'

Gem::Specification.new do |spec|
  spec.name          = "acli"
  spec.version       = Acli::VERSION
  spec.authors       = ["Eugen Pirogoff"]
  spec.email         = ["eugenpirogoff@me.com"]
  spec.summary       = %q{CLI tool for installing swift libraries}
  spec.description   = %q{a(wesome swift)cli}
  spec.homepage      = "https://github.com/eugenpirogoff/acli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.0.0' 

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.3.2"
  spec.add_development_dependency 'pry', "~> 0.10.1"

  spec.add_dependency 'thor', '~> 0.19.1'
  spec.add_dependency 'typhoeus', '~> 0.6.9'
  spec.add_dependency 'nokogiri',  '~> 1.6.3.1'
  spec.add_dependency 'zip', '~> 2.0.2'
end
