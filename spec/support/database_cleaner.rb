RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, except: %w[ar_internal_metadata],
                               pre_count: true, cache_tables: true)
  end
  config.before(:suite) do |spec|
    if spec.metadata[:js]
      ActiveRecord::Base.connection.raw_connection.autocommit = true
      DatabaseCleaner.strategy = :truncation
    else
      DatabaseCleaner.strategy = :transaction
    end
    FactoryBot.reload
  end

  config.before(:each){ DatabaseCleaner.start }
  config.after(:each){ DatabaseCleaner.clean }
end