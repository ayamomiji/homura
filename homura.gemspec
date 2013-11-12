# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'homura/version'

Gem::Specification.new do |spec|
  spec.name          = 'homura'
  spec.version       = Homura::VERSION
  spec.authors       = ['ayaya']
  spec.email         = ['ayaya@ayaya.tw']
  spec.description   = %q{Homura is a simple layout generator and helpers for rails}
  spec.summary       = %q{Homura is a simple layout generator and helpers for rails}
  spec.homepage      = 'https://github.com/ayamomiji/homura'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 3'
  spec.add_dependency 'slim-rails'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 2'
  spec.add_development_dependency 'rspec-rails', '>= 2'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'sqlite3'
end
