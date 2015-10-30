# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bugsnag-error-users/version'

Gem::Specification.new do |spec|
  spec.name          = "bugsnag-error-users"
  spec.version       = BugsnagErrorUsers::VERSION
  spec.authors       = ["Christopher Butcher"]
  spec.email         = ["christopher.butcher@shopify.com"]

  spec.summary       = %q{Fetch usernames from Bugsnag error urls.}
  spec.description   = %q{Fetch usernames from Bugsnag error urls.}
  spec.homepage      = "https://github.com/chrisbutcher/bugsnag-error-users"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "mocha"
  spec.add_runtime_dependency "bugsnag-api"
end
