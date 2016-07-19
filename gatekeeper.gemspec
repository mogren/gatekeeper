# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "gatekeeper"
  spec.version       = '1.0'
  spec.authors       = ["Jens Skott"]
  spec.email         = ["jens.skott@gmail.com"]
  spec.summary       = %q{Make rancher scale}
  spec.description   = %q{Make rancher scale greater.}
  spec.homepage      = "https://github.com/jensskott/gatekeeper"
  spec.license       = "MIT"

  spec.files         = ['lib/gatekeeper.rb']
  spec.executables   = ['bin/gatekeeper']
  spec.test_files    = ['tests/test_gatekeeper.rb']
  spec.require_paths = ["lib"]
end
