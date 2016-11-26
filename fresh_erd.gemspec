# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fresh_erd/version'

Gem::Specification.new do |spec|
  spec.name          = "fresh_erd"
  spec.version       = FreshErd::VERSION
  spec.authors       = ["Yasuhiro Matsumura"]
  spec.email         = ["ym.contributor@gmail.com"]

  spec.summary       = %q{FreshERD is a gem that outputs ER diagram by setting yaml.}
  spec.description   = %q{FreshERD is a gem that outputs ER diagram by setting yaml. The output of ER diagram is realized by wrapping call of rails-erd.}
  spec.homepage      = "https://github.com/muramurasan/fresh_erd"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "rails-erd", "~> 1.1.0"
  spec.add_dependency "thor"
end
