token = ENV.fetch("FLIPPER_TOKEN")

Flipper.configure do |config|
  config.default do
    Flipper::Cloud.new(token)
  end
end
