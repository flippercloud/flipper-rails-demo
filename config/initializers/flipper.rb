require "flipper/cloud"
require "flipper/adapters/active_record"

Flipper.configure do |config|
  config.default do
    Flipper::Cloud.new do |cloud|
      cloud.local_adapter = Flipper::Adapters::ActiveRecord.new
    end
  end
end

Rails.configuration.middleware.use Flipper::Middleware::Memoizer, preload_all: true
