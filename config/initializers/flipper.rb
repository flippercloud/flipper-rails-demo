token = ENV.fetch("FLIPPER_TOKEN")

require "flipper-cloud"
Flipper.configure do |config|
  config.default do
    Flipper::Cloud.new(token)
  end
end

require "flipper/middleware/memoizer"
Rails.configuration.middleware.use Flipper::Middleware::Memoizer, preload_all: true
