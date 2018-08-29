$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "marunomi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "marunomi"
  s.version     = Marunomi::VERSION
  s.authors     = ["author"]
  s.email       = ["author@example.com"]
  s.homepage    = "http://example.com"
  s.summary     = "Summary of Marunomi."
  s.description = "Description of Marunomi."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  # s.add_dependency "rails", "~> 5.2.1"
  s.add_dependency 'activesupport'

  s.add_development_dependency "rails"
  s.add_development_dependency "sqlite3"
end
