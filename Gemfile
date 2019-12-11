source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '4.2.0'
gem 'pg', '~> 0.18.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'haml-rails', '~> 0.8'
gem 'devise'
gem 'activeadmin', github: 'activeadmin'
gem 'carrierwave'
gem 'ransack'
gem 'acts_as_follower', '~> 0.2.0'
gem 'acts_as_votable', '~> 0.10.0'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary-edge', '~> 0.12.3.0'
gem 'chartkick'
# gem 'puma', '~> 3.4'
gem 'rubocop'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'foundation-rails'
gem 'font-awesome-rails'
gem 'mini_magick'
gem 'breadcrumbs_on_rails'
gem 'chosen-rails'
gem 'axlsx_rails'
gem 'aws-sdk', '~> 2'
gem 'carrierwave_direct', :git => "git://github.com/dwilkie/carrierwave_direct.git"


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'faker'
  gem 'pry-rails'
  gem 'letter_opener'
  # gem 'sqlite3'
  gem 'better_errors'
  # this gem provides n+1 queries information
  gem 'bullet'
  gem 'uniform_notifier'
end

group :production do
  gem 'wkhtmltopdf-heroku'
  gem 'rails_12factor', group: :production
end

gem 'rack-timeout', '0.4.2'
gem 'rack-canonical-host', '0.2.2'

# Monitor the app
gem 'scout_apm'

gem 'seed_dump'

# To import xls
gem 'spreadsheet'

# Geocoder
gem 'geocoder'

gem 'net-ssh', '~> 4.2'

group :development do
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma', '~> 3.0', '>= 3.0.2', require: false
  gem 'capistrano-ssh-doctor'
end
