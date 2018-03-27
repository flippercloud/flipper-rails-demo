require "flipper/cloud"
require "flipper/adapters/active_record"

Flipper.configure do |config|
  config.default do
    token = ENV.fetch("FLIPPER_TOKEN")

    Flipper::Cloud.new(token) do |cloud|
      cloud.local_adapter = Flipper::Adapters::ActiveRecord.new
    end
  end
end

require "flipper/middleware/memoizer"
Rails.configuration.middleware.use Flipper::Middleware::Memoizer, preload_all: true
