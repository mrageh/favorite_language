# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'favorite_language/version'

Gem::Specification.new do |spec|
  spec.name          = "favorite_language"
  spec.version       = FavoriteLanguage::VERSION
  spec.authors       = ["Adam89"]
  spec.email         = ["adam.dev89@gmail.com"]
  spec.summary       = "Simple command line application"
  spec.description   = "Fetch a users favourite programming language"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "octokit"
  spec.add_development_dependency "thor"
  spec.add_development_dependency "rack-test"
end
