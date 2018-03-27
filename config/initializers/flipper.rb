require "flipper/cloud"
require "flipper/adapters/active_record"

Flipper.configure do |config|
  config.default do
    token = ENV.fetch("FLIPPER_TOKEN")
    debug = ENV.fetch("FLIPPER_DEBUG", "0").to_i == 1
    read_timeout = ENV.fetch("FLIPPER_READ_TIMEOUT", 5).to_f
    open_timeout = ENV.fetch("FLIPPER_OPEN_TIMEOUT", 5).to_f
    sync_interval = ENV.fetch("FLIPPER_SYNC_INTERVAL", 10).to_i

    Flipper::Cloud.new(token) do |cloud|
      cloud.instrumenter = ActiveSupport::Notifications
      cloud.read_timeout = read_timeout
      cloud.open_timeout = open_timeout
      cloud.sync_interval = sync_interval
      cloud.debug_output = STDOUT if debug
      cloud.local_adapter = Flipper::Adapters::ActiveRecord.new
    end
  end
end

require "flipper/middleware/memoizer"
Rails.configuration.middleware.use Flipper::Middleware::Memoizer, preload_all: true
