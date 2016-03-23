# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "stub_constant/version"

Gem::Specification.new do |spec|
  spec.name          = "stub_constant"
  spec.version       = StubConstant::VERSION
  spec.authors       = ["Máximo Mussini", "Max Jacobson"]
  spec.email         = ["maximomussini@gmail.com", "max@hardscrabble.net"]

  spec.summary       = "Super easy way to stub classes and modules for tests"
  spec.description   = "While writing isolation tests, you may want to " \
                       "stub constants. This makes it super easy."
  spec.homepage      = "https://github.com/maxjacobson/stub_constant"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
end
