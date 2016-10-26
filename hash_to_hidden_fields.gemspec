# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hash_to_hidden_fields/version"

Gem::Specification.new do |s|
  s.name        = "hash_to_hidden_fields"
  s.version     = HashToHiddenFields::VERSION
  s.authors     = ["Brian Hempel"]
  s.email       = ["plasticchicken@gmail.com"]
  s.homepage    = "https://github.com/brianhempel/hash_to_hidden_fields"
  s.summary     = %q{In goes a hash, out comes hidden fields. Great for preserving Rails parameters without abusing the session.}
  s.description = s.summary

  s.rubyforge_project = "hash_to_hidden_fields"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"

  s.add_runtime_dependency "rack",       ">= 1.2"
  s.add_runtime_dependency "actionpack", '>= 3'
end
