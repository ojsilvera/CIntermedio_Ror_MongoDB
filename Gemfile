source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
# gem 'pg', '>= 0.18', '< 2.0'
# Use mongoDB as the database for Action Document Model
gem 'mongoid', '~> 7.2'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# https://rubygems.org/gems/bootstrap
gem 'bootstrap', '~> 4.6'
# Bootstrap JavaScript depends on jQuery. If you're using Rails 5.1+
gem 'jquery-rails', '~> 4.4'
# Font-Awesome SASS gem for use in Ruby projects
gem 'font-awesome-sass', '~> 5.15', '>= 5.15.1'
# Asynchronous processing library for Ruby
gem 'sucker_punch', '~> 3.0', '>= 3.0.1'
# Just font
gem 'font-roboto-rails', '~> 0.0.3'
# Flexible authentication solution for Rails with Warden
# https://rubygems.org/gems/devise
gem 'devise', '~> 4.7', '>= 4.7.3'
# AASM is a continuation of the acts-as-state-machine rails plugin, built for plain Ruby objects.
gem 'aasm', '~> 5.1', '>= 5.1.1'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'binding_of_caller', '~> 1.0'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Preview email in the default browser instead of sending it.
  # https://github.com/ryanb/letter_opener
  gem 'factory_bot_rails', '~> 6.1'
  gem 'letter_opener'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.2'
  gem 'ruby_jard', '~> 0.3.1'
end

group :development do
  gem 'listen', '~> 3.2'
  # gemas para mejores practicas
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  # proprocesador para html
  gem 'haml-rails', '~> 2.0', '>= 2.0.1'
  # gemas para mejores practicas
  gem 'rubocop', require: false
  gem 'rufo', '~> 0.12.0'
  gem 'solargraph', '~> 0.39.17'
  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'mongoid-rspec', '~> 4.1'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# grupo agregado manualmente para el desarrollo de TDD y BDD con rspec
# sino está ya agregada por defecto, agregar la gema capybara en este grupo
group :test do
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'faker', '~> 2.16'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Manejo de formularios,
# mas informacion en: https://github.com/heartcombo/simple_form
gem 'simple_form'

# Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.
# ref: https://rubygems.org/gems/annotate
# gem 'annotate', '~> 3.1', '>= 3.1.1'

# Haml (HTML Abstraction Markup Language)
# https://rubygems.org/gems/haml
gem 'haml', '~> 5.2', '>= 5.2.1'

# A set of common locale data and translations to internationalize and/or localize your Rails applications.
# https://rubygems.org/gems/rails-i18n
gem 'rails-i18n', '~> 6.0'

# Nested forms are forms that handle nested models and attributes in one form
# https://github.com/nathanvda/cocoon
gem 'cocoon'

# Continuation of the simple authorization solution for Rails which is decoupled from user roles.
# https://rubygems.org/gems/cancancan
gem 'cancancan', '~> 1.15'
