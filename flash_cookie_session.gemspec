# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "flash_cookie_session/version"

Gem::Specification.new do |s|
  s.name        = "flash_cookie_session"
  s.version     = FlashCookieSession::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Trevor Turk"]
  s.email       = ["trevorturk@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/flash_cookie_session"
  s.summary     = %q{Rails 3 cookie sessions can cooperate with Flash}
  s.description = %q{Useful for Flash-based file uploaders (SWFUpload, Uploadify, Plupload, etc)}

  s.rubyforge_project = "flash_cookie_session"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("rails", ["~> 3.0"])
end
