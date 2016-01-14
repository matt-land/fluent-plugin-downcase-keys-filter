# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "fluent-plugin-downcase-keys-filter"
  gem.version     = "0.1"
  gem.license     = "Apache 2.0"
  gem.authors     = ["Matt Land"]
  gem.email       = "mwfrankland@gmail.com"
  gem.homepage    = "https://github.com/matt-land/fluent-plugin-downcase-keys-filter"
  gem.summary     = %q[Fluentd output plugin. Downcases all keys and re-emit the records.]
  gem.has_rdoc    = false

  gem.files       = `git ls-files`.split("\n")
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_dependency "fluentd", "~> 0.10.9"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "bundler"
  gem.add_development_dependency "rake"
  gem.add_development_dependency 'coveralls'

end
