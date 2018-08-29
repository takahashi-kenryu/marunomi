$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "marunomi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "marunomi"
  s.version     = Marunomi::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Marunomi."
  s.description = "TODO: Description of Marunomi."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"

  s.add_development_dependency "sqlite3"
end
