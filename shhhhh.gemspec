Gem::Specification.new do |s|
  s.name        = 'shhhhh'
  s.version     = '0.0.1'
  s.date        = '2010-04-28'
  s.summary     = "shhhhh"
  s.description = "Quiet your logs"
  s.authors     = ["Curtis Edmond"]
  s.email       = 'curtis.edmond@gmail.com'
  s.files       = `git ls-files -z`.split("\x0")
  s.test_files  = %w(spec/lib/middleware_spec.rb)
  s.homepage    = 'http://rubygems.org/gems/shhhhh'
  s.license     = 'MIT'

  s.add_dependency 'railties', '>= 3.2.19', '< 5.0'
  s.add_development_dependency 'rake', '10.3.2'
  s.add_development_dependency 'tzinfo', '1.2.1'
  s.add_development_dependency 'rspec', '3.0.0'
end
