# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rails'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # config.include CsvHelper

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(
      :truncation,
      except: %w(ar_internal_metadata)
    )
    begin
      DatabaseCleaner.start
      FactoryBot.lint
    ensure
      DatabaseCleaner.clean
    end

    Grade::VALID_TITLES.each do |grade|
      Grade.create!(title: grade)
    end

    Program::VALID_TITLES.each do |program|
      Program.create!(title: program)
    end
  end

  config.around(:each) do |ex|
    DatabaseCleaner.cleaning do
      ex.run
    end
  end

  config.after(:suite) do
    Grade.destroy_all
    Program.destroy_all
  end

  # config.after(:suite) do
  #   # clean up CSVs
  #   # be careful not to put .csv files that you care about in /tmp
  #   Dir["#{Rails.root}/tmp/*.csv"].each { |filepath| File.delete(filepath) }
  # end
end
