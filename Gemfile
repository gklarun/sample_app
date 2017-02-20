source 'https://rubygems.org'
ruby '2.1.2'
#ruby-gemset=railstutorial_rails_4_0

gem 'rails', '4.0.8'
gem 'rake', '11.3.0'
gem 'byebug'
gem 'bcrypt'
gem 'slim'
gem 'sass'
#Image upload and process
gem "carrierwave"
gem "carrierwave-crop"
gem "copy_carrierwave_file"
#Note: to install this gem need to run sudo apt-get install libmagickwand-dev, or sudo gem install rmagick.
# Otherwise, if now running a new version of ruby, make sure openssl isn't screwing you:
# rvm pkg install openssl
# rvm reinstall all --force
gem 'rmagick'

gem 'bootstrap-modal-rails'

group :development, :test do
  #gem 'sqlite3', '1.3.8'

  gem 'rspec-rails', '2.13.1'
  gem 'mysql2','~> 0.3.20'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'cucumber'
  gem 'cucumber-rails' ,:require => false
  gem 'database_cleaner'
  gem 'mysql2','~> 0.3.20'
end

gem 'sass-rails', '4.0.3'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'
gem 'sprockets', '2.11.0'
gem 'launchy'
gem 'bootstrap-sass','2.3.2.0'
gem 'factory_girl_rails', '4.2.0'
gem 'poltergeist'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do

  gem 'rails_12factor', '0.0.2'
	gem 'pg'
end
