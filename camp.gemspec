# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'camp/version'

Gem::Specification.new do |spec|
  spec.name          = "pyama-camp"
  spec.version       = Camp::VERSION
  spec.authors       = ["pyama86"]
  spec.email         = ["www.kazu.com@gmail.com"]

  spec.summary       = %q{I want to Go camping.}
  spec.description   = %q{I want to Go camping.}
  spec.homepage      = "https://github.com/pyama86/camp/"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "nokogiri"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "bundler"
end
