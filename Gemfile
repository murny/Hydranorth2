source 'https://rubygems.org'

# semantically-meaningful name for OS-specific gems
def os_is(re)
  RbConfig::CONFIG['host_os'] =~ re
end

gem 'solrizer', git: 'https://github.com/mbarnett/solrizer.git', branch: 'solrizable_path_types'

gem 'sufia', '~> 7.2.0'
gem 'flipflop', git: 'https://github.com/jcoyne/flipflop.git', branch: 'hydra'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.0'
# Use sqlite3 as the database for Active Record
gem 'mysql2'
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
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'blacklight-hierarchy'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'solr_wrapper', '>= 0.3'
  gem 'fcrepo_wrapper'
  gem 'rspec-rails'
  gem 'rubocop'
  if ENV['LOCAL_COLLECTION_NORTH_PATH']
    gem 'collection_north', path: ENV['LOCAL_COLLECTION_NORTH_PATH']
  else
    gem 'collection_north', git: 'https://github.com/ualbertalib/CollectionNorth.git'
  end
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'pry', '~> 0.10.4'
  gem 'better_errors'

  # fixes an issue I'm experiencing locally, and I'd rather have the solution documented here rather than go on a
  # fishing expedition if I set up a new gemset or my machine spontaneously combusts. Related to
  # https://github.com/rails/rails/issues/26658 TODO: re-evealuate on next Ruby update -- MB
  gem 'rb-readline', platforms: :ruby, install_if: os_is(/darwin/)
end

gem 'rsolr', '~> 1.0'
gem 'devise'
gem 'devise-guests', '~> 0.3'
