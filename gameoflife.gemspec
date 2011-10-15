# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gameoflife/version"

Gem::Specification.new do |s|
  s.name        = "gameoflife"
  s.version     = Gameoflife::VERSION
  s.authors     = ["Rocky Jaiswal"]
  s.email       = ["rocky.jaiswal@gmail.com"]
  s.homepage    = "http://rockyj.in"
  s.summary     = "A simple game of life implementation for learning ruby and rspec" 
  s.description = "A simple game of life implementation for learning ruby and rspec"

  s.rubyforge_project = "gameoflife"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
