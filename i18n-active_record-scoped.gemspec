# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i18n/active_record/scoped/version'

Gem::Specification.new do |spec|
  spec.name          = "i18n-active_record-scoped"
  spec.version       = I18n::ActiveRecord::Scoped::VERSION
  spec.authors       = ["Solomon White"]
  spec.email         = ["rubysolo@gmail.com"]
  spec.summary       = %q{scoped i18n backend}
  spec.description   = %q{filter i18n translations on additional scopes}
  spec.homepage      = "https://github.com/rubysolo/i18n-active_record-scoped"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "i18n-active_record" # requires unreleased version from github
  spec.add_dependency "activerecord"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_development_dependency "sqlite3"
end
