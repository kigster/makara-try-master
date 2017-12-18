lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'makara/try_master/version'

Gem::Specification.new do |spec|
  spec.name    = 'makara-try-master'
  spec.version = Makara::TryMaster::VERSION
  spec.authors = ['Konstantin Gredeskoul']
  spec.email   = ['kigster@gmail.com']

  spec.summary     = %q{Stuff}
  spec.description = %q{More stuff}
  spec.homepage    = 'https://github.com/kigster/makara-try-master'
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'makara'

  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end

