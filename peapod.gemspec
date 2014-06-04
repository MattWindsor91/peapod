# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'peapod/version'

Gem::Specification.new do |spec|
  spec.name          = 'peapod'
  spec.version       = Peapod::VERSION
  spec.authors       = ['Matt Windsor']
  spec.email         = ['matt.windsor@ury.york.ac.uk']
  spec.summary       = %q(Simple interface to the URY podcast system)
  spec.description   = %q(
    Peapod is a simple, lowish-level interface to the URY podcast database.
  )
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_dependency 'sequel', '~> 4'
  spec.add_dependency 'pg', '~> 0.16'
  spec.add_dependency 'term-ansicolor', '~>1.3'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 3.0.0.rc1', '<4'
  spec.add_development_dependency 'simplecov'
end
