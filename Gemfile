source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 5.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

gem 'libv8', '3.16.14.7'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Cancan for authentication
gem 'cancancan', '~> 1.10.1'
# Less for bootstrap
gem "less-rails"
# Bootstrap for layout
gem 'twitter-bootstrap-rails', '3.2.0'

gem 'growlyflash'
# angularjs-rails
gem 'angularjs-rails', '~> 1.4', '>= 1.4.8'

gem 'bootstrap-material-design'

gem 'rails_12factor', group: :production

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Active Record
# gem 'activerecord', '>= 4.1.2'

# Multiple Table Inhiterance
gem 'active_record-acts_as' #, '1.0.2'

# Access an IRB console on exception pages or by using <%= console %> in views
gem 'web-console', '~> 2.0', group: :development

gem 'quiet_assets', group: :development

group :development, :test do
  # Create test coverage with codeclimate
  gem "codeclimate-test-reporter", group: :test, require: nil

  # Create test coverage with coveralls
  gem 'coveralls', require: false

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 4.0.4'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Cucumber for acceptance tests
  gem 'cucumber', '~> 2.0.0'

  # Rspec for unit tests
  gem 'rspec', '~> 3.2'

  gem 'mocha', '1.1.0'

  gem 'rspec-rails', '~> 3.0'

  #gem 'factory_girl', '~> 4.5.0'
  gem 'factory_girl_rails'

  gem 'shoulda-matchers', '~> 2.8.0'

  gem 'database_cleaner'
end

group :users, :authentication do
  gem 'devise', '~> 3.5.6'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem "poltergeist"
  gem 'selenium-webdriver', :require => false
end
