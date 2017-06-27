source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
gem 'dotenv-rails'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use omniauth-facebook for fb log in feature
gem 'omniauth-facebook'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # RSpec for Rails 3+
  gem 'rspec-rails'
  # A library for setting up Ruby objects as test data.
  gem 'factory_girl_rails'
  # Brings back `assigns` and `assert_template` to your Rails tests
  gem 'rails-controller-testing'
  # Collection of testing matchers extracted from Shoulda
  gem 'shoulda-matchers'
  # Guard::RSpec automatically run your specs (much like autotest)
  gem 'guard-rspec', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Guard::Bundler automatically install/update your gem bundle when needed
  gem 'guard-bundler', require: false
  #Guard reload; automatically reload your browser when 'view' files are modified
  gem 'guard-livereload', '~> 2.5', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Additional Gems
# Pg is the Ruby interface to the PostgresDB
gem 'pg', '~> 0.18'
# Flexible authentication solution for Rails with Warden
gem 'devise'
# A library for generating fake data such as names, addresses, and phone numbers.
gem 'faker'
# Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup.
gem 'simple_form'
# A gem to automate using jQuery with Rails
gem 'jquery-rails'
# Official Sass port of Bootstrap 2 and 3.
gem 'bootstrap-sass'
# Use elasticsearch as application search engine
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
