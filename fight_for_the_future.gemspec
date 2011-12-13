require './lib/fight_for_the_future/version'

Gem::Specification.new do |s|
  s.name        = 'fight_for_the_future'
  s.version     = FightForTheFuture::VERSION
  s.authors     = ['Tyler Hunt']
  s.email       = ['tyler@tylerhunt.com']
  s.homepage    = ''
  s.summary     = %q{Utilities to supplement the cause of Fight for the Future.}

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'rmagick', '~> 2.13.1'
end
