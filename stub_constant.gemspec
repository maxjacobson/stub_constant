# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stub_constant/version'

Gem::Specification.new do |spec|
  spec.name          = "stub_constant"
  spec.version       = StubConstant::VERSION
  spec.authors       = ["Máximo Mussini", "Max Jacobson"]
  spec.email         = ["maximomussini@gmail.com", "max@hardscrabble.net"]

  spec.summary       = %q{Super easy way to stub classes and modules for tests}
  spec.description   = %q{While writing isolation tests, you may want to stub constants. This makes it super easy.}
  spec.homepage      = "https://github.com/maxjacobson/stub_constant"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
