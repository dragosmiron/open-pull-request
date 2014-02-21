# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'open-pull-request/version'

Gem::Specification.new do |spec|
  spec.name          = "open-pull-request"
  spec.version       = Open::PullRequest::VERSION
  spec.authors       = ["Dragos Miron"]
  spec.email         = ["dragosmr@gmail.com"]
  spec.summary       = %q{Open a pull request in browser with current branch}
  spec.homepage      = "http://github.com/dragosmiron/git-pull-request"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"

  spec.add_dependency 'ruby-trello'
end
