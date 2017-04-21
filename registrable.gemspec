# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'registrable/version'

Gem::Specification.new do |spec|
  spec.name          = 'registrable'
  spec.version       = Registrable::VERSION
  spec.authors       = ['Ryan Scott Lewis']
  spec.email         = ['ryanscottlewis@gmail.com']

  spec.summary       = "Allows a class to hold a registry of it's instances"
  spec.description   = "Extend in a class to allow it to hold a registry of it's instances"
  spec.homepage      = 'https://github.com/RyanScottLewis/registrable'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'fuubar', '~> 2.2'
  spec.add_development_dependency 'guard-rubocop', '~> 1.2'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency 'guard-yard', '~> 2.2'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.48'
  spec.add_development_dependency 'version', '~> 1.0'
  spec.add_development_dependency 'yard', '~> 0.9'
end
