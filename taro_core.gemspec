# frozen_string_literal: true

$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "taro_core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "taro_core"
  s.version     = TaroCore::VERSION
  s.authors     = ["p.hoai.le"]
  s.email       = ["yeuem1vannam@users.noreply.github.com"]
  s.homepage    = "https://tarobot.com"
  s.summary     = "TaroCore"
  s.description = "Core models for Taro"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"
  s.add_dependency "yahoo-japanese-analysis", "~> 0.1.2"

  s.add_development_dependency "sqlite3"
end
