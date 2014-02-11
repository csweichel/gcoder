# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gcoder/version'

Gem::Specification.new do |spec|
  spec.name          = "gcoder"
  spec.version       = GCoder::VERSION
  spec.authors       = ["32leaves"]
  spec.email         = ["info@32leav.es"]
  spec.summary       = %q{GCoder is a Ruby library to deal with GCode in various flavours.}
  spec.description   = %q{GCoder is designed to make scripting GCode filters easy, and to work with Opal to enable web-based GCode editors/viewers.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
