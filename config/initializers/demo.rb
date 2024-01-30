# These initializers are all just to make a smooth demo experience.

# Set RESEED=true to reseed the database on every app restart
if ENV["RESEED"]
  Rails.application.config.after_initialize do
    ActiveRecord::Base.configurations.configs_for(env_name: Rails.env).each do |config|
      ActiveRecord::Tasks::DatabaseTasks.reconstruct_from_schema(config, ActiveRecord.schema_format)
    end

    ActiveRecord::Tasks::DatabaseTasks.load_seed
  end
end

# Set FLIPPER_SESSION_STORE=true to use the browser session instead of local database as
# the flipper storage adapter. This allows multiple users to play with the same demo instance
# without interfering with eachother.
if ENV["FLIPPER_SESSION_STORE"]
  require 'flipper/adapters/session'
  require 'flipper/middleware/session'

  Rails.application.configure do
    config.middleware.use Flipper::Middleware::Session
  end
end

# Whenever the app loads fresh, disable all the features so it starts from
# a consistent state each time.
# You wouldn't normally want to do this, but for a demo, it's pretty handy.
Rails.application.config.after_initialize do
  begin
    Flipper.features.each(&:disable)
  rescue
    # That's fine if the DB hasn't been created yet
  end
end
