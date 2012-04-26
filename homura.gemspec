# -*- encoding: utf-8 -*-
require File.expand_path('../lib/homura/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['ayaya']
  gem.email         = ['ayaya@ayaya.tw']
  gem.description   = %q{Homura is a simple layout generator and helpers for rails}
  gem.summary       = %q{Homura is a simple layout generator and helpers for rails}
  gem.homepage      = ''

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'homura'
  gem.require_paths = ['lib']
  gem.version       = Homura::VERSION

  gem.add_dependency 'rails', '>= 3'
  gem.add_dependency 'slim-rails'

  gem.add_development_dependency 'rspec', '>= 2'
  gem.add_development_dependency 'rspec-rails', '>= 2'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'capybara'
  gem.add_development_dependency 'sqlite3'
end
