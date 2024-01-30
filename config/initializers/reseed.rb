# Set RESEED=true to reseed the database on every restart
if ENV["RESEED"]
  Rails.application.config.after_initialize do
    ActiveRecord::Base.configurations.configs_for(env_name: Rails.env).each do |config|
      ActiveRecord::Tasks::DatabaseTasks.reconstruct_from_schema(config, ActiveRecord.schema_format)
    end

    ActiveRecord::Tasks::DatabaseTasks.load_seed
  end
end
