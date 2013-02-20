# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'interspire'

Gem::Specification.new do |gem|
  gem.name          = "interspire"
  gem.version       = Interspire::VERSION
  gem.authors       = ["Dale Campbell"]
  gem.email         = ["oshuma@gmail.com"]
  gem.description   = %q{Ruby library for the Interspire API.}
  gem.summary       = %q{Ruby library for the Interspire API.}
  gem.homepage      = "https://github.com/Oshuma/interspire"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'nokogiri'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'yard'
end
