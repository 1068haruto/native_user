source "https://rubygems.org"

gem "rails", "~> 7.2.2", ">= 7.2.2.1"  # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "sprockets-rails"                  # The original asset pipeline for Rails
gem "pg", "~> 1.1"                     # Use postgresql as the database for Active Record
gem "puma", ">= 5.0"                   # Use the Puma web server
gem "jsbundling-rails"                 # Bundle and transpile JavaScript
gem "turbo-rails"                      # Hotwire's SPA-like page accelerator
gem "stimulus-rails"                   # Hotwire's modest JavaScript framework
gem "cssbundling-rails"                # Bundle and process CSS
gem "jbuilder"                         # Build JSON APIs with ease
# gem "redis", ">= 4.0.1"              # Use Redis adapter to run Action Cable in production
# gem "kredis"                         # Use Kredis to get higher-level data types in Redis
gem "bcrypt", "~> 3.1.7"               # Use Active Model has_secure_password

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# gem "image_processing", "~> 1.2"     # Use Active Storage variants

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false               # Static analysis for security vulnerabilities
  gem "rubocop-rails-omakase", require: false  # Omakase Ruby styling
end

group :development do
  gem "web-console"                    # Use console on exceptions pages
end

group :test do
  gem "capybara"                       # Use system testing
  gem "selenium-webdriver"
end
