require './lib/censorship/version'

Gem::Specification.new do |s|
  s.name        = 'censorship'
  s.version     = Censorship::VERSION
  s.authors     = ['Tyler Hunt']
  s.email       = ['tyler@tylerhunt.com']
  s.homepage    = ''
  s.summary     = %q{Overlays a censorship message and link onto an image.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
