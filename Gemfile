source 'https://rubygems.org'
ruby '2.2.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.13', '< 0.5'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'execjs'
gem 'therubyracer', platforms: :ruby
gem 'bootstrap-sass', '3.2.0.2'
# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1.2'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#Authentication
gem 'devise'
#Authorization
gem 'cancan'

# date picker
gem 'bootstrap-datepicker-rails'

#payment
gem 'paypal-express'
gem 'paypal-sdk-permissions'

gem 'paypal-sdk-merchant'

gem 'rack-cors', require: 'rack/cors'
gem 'jwt'

#stripe
gem 'stripe'

#bootstrap and fontawesome
gem 'frontend-generators'

# Social media power
gem 'omniauth'
gem 'instagram'
gem 'omniauth-instagram'
gem 'omniauth-facebook'
gem 'omniauth-facebook-access-token'
gem 'omniauth-pinterest'
gem 'omniauth-google'
#gem 'omniauth-google-oauth2'
gem 'koala'

#bootstrap-editable-rails
gem 'bootstrap-editable-rails'

# jeditable-rails
gem 'jeditable-rails'

#Country select gem
gem 'country_select'
#upload image
 gem 'remotipart', '~> 1.2' 
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#active merchant
gem 'activemerchant'

# File upload
gem 'carrierwave'

# Search
gem 'ransack', github: 'activerecord-hackery/ransack'

# Pagination
gem 'will_paginate', github: 'jonatack/will_paginate'
# Groups

# for precompile
group :assets do
  gem 'therubyracer'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # For deployment
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  gem 'capistrano-passenger'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'pry-rails'
end
