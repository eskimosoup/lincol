source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
gem 'therubyracer'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'rspec-rails', '~> 3.0'
  gem "factory_girl_rails"
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'quiet_assets', '~> 1.1.0'
  gem 'guard-rspec', require: false
  gem 'rack-mini-profiler'
  gem 'flamegraph'
  gem 'stackprof', '~> 0.2.7'
  gem "bullet"
end

source 'https://rails-assets.org' do
  gem 'rails-assets-slick.js'
  gem 'rails-assets-colorbox'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'optimadmin_generators', git: 'git@github.com:eskimosoup/optimadmin_generators.git', group: :development
gem 'optimadmin', git: 'git@github.com:eskimosoup/Optimadmin.git'
gem 'friendly_id', '~> 5.1.0'
#gem 'optimadmin', path: '../optimadmin'
