$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "m3_table_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "m3_table_admin"
  s.version     = M3TableAdmin::VERSION
  s.authors     = ["Your name"]
  s.email       = ["Your email"]
  s.homepage    = ""
  s.summary     = "Table admin new gem."
  s.description = " Description of TableAdmin."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec", "~> 3.0.0"

  s.add_dependency "rails", "~> 4.1.1"
  s.add_dependency 'turbolinks'
  s.add_dependency "haml-rails", "0.5.3"
  s.add_dependency 'sass-rails', '~> 4.0.3'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'bootstrap-sass', '~> 3.1.1.1'
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'simple_form', '~> 3.0.2'
  s.add_dependency 'kaminari', '~> 0.16.1'
  s.add_dependency 'bootstrap-wysihtml5-rails', '~> 0.3.2.100'
end
