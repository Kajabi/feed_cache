# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "feed_cache/version"

Gem::Specification.new do |s|
  s.name        = "feed_cache"
  s.version     = FeedCache::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Brendon Murphy"]
  s.email       = ["xternal1+github@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A thin wrapper over Feedzirra with injected caching}
  s.description = s.summary

  s.add_dependency "feedzirra", "~> 0.0.23"

  s.add_development_dependency "rspec"
  s.add_development_dependency "activesupport", "~> 2.3.5"

  s.rubyforge_project = "feed_cache"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
