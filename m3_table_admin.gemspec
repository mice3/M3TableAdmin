# -*- encoding: utf-8 -*-
# stub: m3_table_admin 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "m3_table_admin"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Your name"]
  s.date = "2014-08-07"
  s.description = " Description of TableAdmin."
  s.email = ["Your email"]
  s.files = ["MIT-LICENSE", "README.rdoc", "Rakefile", "app/assets", "app/assets/images", "app/assets/images/m3_table_admin", "app/assets/javascripts", "app/assets/javascripts/m3_table_admin", "app/assets/javascripts/m3_table_admin/admin", "app/assets/javascripts/m3_table_admin/admin/application.js", "app/assets/javascripts/m3_table_admin/frontend", "app/assets/javascripts/m3_table_admin/frontend/application.js", "app/assets/stylesheets", "app/assets/stylesheets/m3_table_admin", "app/assets/stylesheets/m3_table_admin/admin", "app/assets/stylesheets/m3_table_admin/admin/_base.scss", "app/assets/stylesheets/m3_table_admin/admin/application.css.scss", "app/assets/stylesheets/m3_table_admin/admin/buttons.css.scss", "app/assets/stylesheets/m3_table_admin/admin/forms.css.scss", "app/assets/stylesheets/m3_table_admin/admin/framework_and_overrides.css.scss", "app/assets/stylesheets/m3_table_admin/frontend", "app/assets/stylesheets/m3_table_admin/frontend/_base.scss", "app/assets/stylesheets/m3_table_admin/frontend/_form.css.scss", "app/assets/stylesheets/m3_table_admin/frontend/_mixins.css.scss", "app/assets/stylesheets/m3_table_admin/frontend/application.css.scss", "app/assets/stylesheets/m3_table_admin/frontend/autoinclude", "app/assets/stylesheets/m3_table_admin/frontend/autoinclude/_flash_messages.css.scss", "app/assets/stylesheets/m3_table_admin/frontend/autoinclude/_modals.css.scss", "app/assets/stylesheets/m3_table_admin/frontend/framework_and_overrides.css.scss", "app/controllers", "app/controllers/m3_table_admin", "app/controllers/m3_table_admin/application_controller.rb", "app/helpers", "app/helpers/m3_table_admin", "app/helpers/m3_table_admin/application_helper.rb", "app/views", "app/views/layouts", "app/views/layouts/m3_table_admin", "app/views/layouts/m3_table_admin/_head.html.haml", "app/views/layouts/m3_table_admin/_navigation.html.haml", "app/views/layouts/m3_table_admin/application.html.haml", "app/views/m3_table_admin", "app/views/m3_table_admin/application", "app/views/m3_table_admin/application/index.html.haml", "app/views/m3_table_admin/table_admin", "app/views/m3_table_admin/table_admin/_filters.html.haml", "app/views/m3_table_admin/table_admin/_form.html.haml", "app/views/m3_table_admin/table_admin/_table.html.haml", "app/views/m3_table_admin/table_admin/edit.html.haml", "app/views/m3_table_admin/table_admin/index.html.haml", "app/views/m3_table_admin/table_admin/new.html.haml", "app/views/m3_table_admin/table_admin/show.html.haml", "config/routes.rb", "lib/m3_table_admin", "lib/m3_table_admin.rb", "lib/m3_table_admin/engine.rb", "lib/m3_table_admin/table.rb", "lib/m3_table_admin/version.rb", "lib/tasks", "lib/tasks/m3_table_admin_tasks.rake", "test/dummy", "test/dummy/README.rdoc", "test/dummy/Rakefile", "test/dummy/app", "test/dummy/app/assets", "test/dummy/app/assets/images", "test/dummy/app/assets/javascripts", "test/dummy/app/assets/javascripts/application.js", "test/dummy/app/assets/stylesheets", "test/dummy/app/assets/stylesheets/application.css", "test/dummy/app/controllers", "test/dummy/app/controllers/application_controller.rb", "test/dummy/app/controllers/concerns", "test/dummy/app/helpers", "test/dummy/app/helpers/application_helper.rb", "test/dummy/app/mailers", "test/dummy/app/models", "test/dummy/app/models/concerns", "test/dummy/app/views", "test/dummy/app/views/layouts", "test/dummy/app/views/layouts/application.html.erb", "test/dummy/bin", "test/dummy/bin/bundle", "test/dummy/bin/rails", "test/dummy/bin/rake", "test/dummy/config", "test/dummy/config.ru", "test/dummy/config/application.rb", "test/dummy/config/boot.rb", "test/dummy/config/database.yml", "test/dummy/config/environment.rb", "test/dummy/config/environments", "test/dummy/config/environments/development.rb", "test/dummy/config/environments/production.rb", "test/dummy/config/environments/test.rb", "test/dummy/config/initializers", "test/dummy/config/initializers/backtrace_silencers.rb", "test/dummy/config/initializers/cookies_serializer.rb", "test/dummy/config/initializers/filter_parameter_logging.rb", "test/dummy/config/initializers/inflections.rb", "test/dummy/config/initializers/mime_types.rb", "test/dummy/config/initializers/session_store.rb", "test/dummy/config/initializers/wrap_parameters.rb", "test/dummy/config/locales", "test/dummy/config/locales/en.yml", "test/dummy/config/routes.rb", "test/dummy/config/secrets.yml", "test/dummy/lib", "test/dummy/lib/assets", "test/dummy/log", "test/dummy/public", "test/dummy/public/404.html", "test/dummy/public/422.html", "test/dummy/public/500.html", "test/dummy/public/favicon.ico", "test/integration", "test/integration/navigation_test.rb", "test/m3_table_admin_test.rb", "test/test_helper.rb"]
  s.homepage = ""
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Table admin new gem."
  s.test_files = ["test/dummy", "test/dummy/app", "test/dummy/app/assets", "test/dummy/app/assets/images", "test/dummy/app/assets/javascripts", "test/dummy/app/assets/javascripts/application.js", "test/dummy/app/assets/stylesheets", "test/dummy/app/assets/stylesheets/application.css", "test/dummy/app/controllers", "test/dummy/app/controllers/application_controller.rb", "test/dummy/app/controllers/concerns", "test/dummy/app/helpers", "test/dummy/app/helpers/application_helper.rb", "test/dummy/app/mailers", "test/dummy/app/models", "test/dummy/app/models/concerns", "test/dummy/app/views", "test/dummy/app/views/layouts", "test/dummy/app/views/layouts/application.html.erb", "test/dummy/bin", "test/dummy/bin/bundle", "test/dummy/bin/rails", "test/dummy/bin/rake", "test/dummy/config", "test/dummy/config/application.rb", "test/dummy/config/boot.rb", "test/dummy/config/database.yml", "test/dummy/config/environment.rb", "test/dummy/config/environments", "test/dummy/config/environments/development.rb", "test/dummy/config/environments/production.rb", "test/dummy/config/environments/test.rb", "test/dummy/config/initializers", "test/dummy/config/initializers/backtrace_silencers.rb", "test/dummy/config/initializers/cookies_serializer.rb", "test/dummy/config/initializers/filter_parameter_logging.rb", "test/dummy/config/initializers/inflections.rb", "test/dummy/config/initializers/mime_types.rb", "test/dummy/config/initializers/session_store.rb", "test/dummy/config/initializers/wrap_parameters.rb", "test/dummy/config/locales", "test/dummy/config/locales/en.yml", "test/dummy/config/routes.rb", "test/dummy/config/secrets.yml", "test/dummy/config.ru", "test/dummy/lib", "test/dummy/lib/assets", "test/dummy/log", "test/dummy/public", "test/dummy/public/404.html", "test/dummy/public/422.html", "test/dummy/public/500.html", "test/dummy/public/favicon.ico", "test/dummy/Rakefile", "test/dummy/README.rdoc", "test/integration", "test/integration/navigation_test.rb", "test/m3_table_admin_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0.0"])
      s.add_runtime_dependency(%q<rails>, ["~> 4.1.1"])
      s.add_runtime_dependency(%q<turbolinks>, [">= 0"])
      s.add_runtime_dependency(%q<haml-rails>, ["= 0.5.3"])
      s.add_runtime_dependency(%q<sass-rails>, ["~> 4.0.3"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
      s.add_runtime_dependency(%q<bootstrap-sass>, ["~> 3.1.1.1"])
      s.add_runtime_dependency(%q<jquery-ui-rails>, [">= 0"])
      s.add_runtime_dependency(%q<simple_form>, ["~> 3.0.2"])
      s.add_runtime_dependency(%q<kaminari>, ["~> 0.16.1"])
      s.add_runtime_dependency(%q<bootstrap-wysihtml5-rails>, ["~> 0.3.2.100"])
      s.add_runtime_dependency(%q<countries>, ["= 0.9.3"])
      s.add_runtime_dependency(%q<country_select>, ["~> 1.3.1"])
    else
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.0.0"])
      s.add_dependency(%q<rails>, ["~> 4.1.1"])
      s.add_dependency(%q<turbolinks>, [">= 0"])
      s.add_dependency(%q<haml-rails>, ["= 0.5.3"])
      s.add_dependency(%q<sass-rails>, ["~> 4.0.3"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<bootstrap-sass>, ["~> 3.1.1.1"])
      s.add_dependency(%q<jquery-ui-rails>, [">= 0"])
      s.add_dependency(%q<simple_form>, ["~> 3.0.2"])
      s.add_dependency(%q<kaminari>, ["~> 0.16.1"])
      s.add_dependency(%q<bootstrap-wysihtml5-rails>, ["~> 0.3.2.100"])
      s.add_dependency(%q<countries>, ["= 0.9.3"])
      s.add_dependency(%q<country_select>, ["~> 1.3.1"])
    end
  else
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.0.0"])
    s.add_dependency(%q<rails>, ["~> 4.1.1"])
    s.add_dependency(%q<turbolinks>, [">= 0"])
    s.add_dependency(%q<haml-rails>, ["= 0.5.3"])
    s.add_dependency(%q<sass-rails>, ["~> 4.0.3"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<bootstrap-sass>, ["~> 3.1.1.1"])
    s.add_dependency(%q<jquery-ui-rails>, [">= 0"])
    s.add_dependency(%q<simple_form>, ["~> 3.0.2"])
    s.add_dependency(%q<kaminari>, ["~> 0.16.1"])
    s.add_dependency(%q<bootstrap-wysihtml5-rails>, ["~> 0.3.2.100"])
    s.add_dependency(%q<countries>, ["= 0.9.3"])
    s.add_dependency(%q<country_select>, ["~> 1.3.1"])
  end
end
