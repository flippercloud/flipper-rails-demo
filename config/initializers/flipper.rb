require "flipper/cloud"
require "flipper/adapters/active_support_cache_store"
require "active_support/cache/memory_store"

token = ENV.fetch("FLIPPER_TOKEN")
debug = ENV.fetch("FLIPPER_DEBUG", "0").to_i == 1
read_timeout = ENV.fetch("FLIPPER_READ_TIMEOUT", 5).to_f
open_timeout = ENV.fetch("FLIPPER_OPEN_TIMEOUT", 5).to_f
memory_cache_ttl = ENV.fetch("FLIPPER_MEMORY_TTL", 10).to_f

Flipper.configure do |config|
  config.default do
    Flipper::Cloud.new(token) do |cloud|
      cloud.instrumenter = ActiveSupport::Notifications
      cloud.read_timeout = read_timeout
      cloud.open_timeout = open_timeout
      cloud.debug_output = STDOUT if debug
      cloud.adapter do |adapter|
        cache = ActiveSupport::Cache::MemoryStore.new
        options = {expires_in: memory_cache_ttl.seconds}
        Flipper::Adapters::ActiveSupportCacheStore.new(adapter, cache, options)
      end
    end
  end
end

require "flipper/middleware/memoizer"
Rails.configuration.middleware.use Flipper::Middleware::Memoizer, preload_all: true
