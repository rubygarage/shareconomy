$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shareconomy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shareconomy"
  s.version     = Shareconomy::VERSION
  s.authors     = ["kolyastepanets"]
  s.email       = ["kolyastepanets@gmail.com"]
  s.summary     = "Summary of Shareconomy."
  s.description = "Description of Shareconomy."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'aasm'
  s.add_dependency "rails", "~> 4.2.6"
  s.add_dependency "devise_token_auth"
  s.add_dependency "omniauth-facebook"
  s.add_dependency "omniauth-google-oauth2"
  s.add_dependency "active_model_serializers"

  s.add_development_dependency "pg"
  s.add_development_dependency "fuubar"
  s.add_development_dependency "ffaker"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "rspec-rails", '~> 3.0'
  s.add_development_dependency "codeclimate-test-reporter"
  s.add_development_dependency 'shoulda-matchers', '~> 3.1'
end
