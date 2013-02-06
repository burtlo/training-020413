# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'legislators/version'

Gem::Specification.new do |gem|
  gem.name          = "legislators"
  gem.version       = Legislators::VERSION
  gem.authors       = ["Franklin Webber"]
  gem.email         = ["franklin.webber@gmail.com"]
  gem.description   = %q{Allows us to query for legislators ... really I mean it.}
  gem.summary       = %q{Allows us to query for legislators}
  gem.homepage      = "https://github.com/burtlo/legislators"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'sunlight', '~> 1.1.0'
end
