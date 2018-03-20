# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'erd-keeper/version'

Gem::Specification.new do |spec|
  spec.name          = "erd-keeper"
  spec.version       = ErdKeeper::VERSION
  spec.authors       = ["Yasuhiro Matsumura"]
  spec.email         = ["ym.contributor@gmail.com"]

  spec.summary       = %q{ErdKeeper is a gem that outputs ER diagram by setting yaml.}
  spec.description   = %q{ErdKeeper is a gem that outputs ER diagram by setting yaml. The output of ER diagram is realized by wrapping call of rails-erd.}
  spec.homepage      = "https://github.com/muramurasan/erd-keeper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "rails-erd", "~> 1.1"
  spec.add_dependency "thor"
end
