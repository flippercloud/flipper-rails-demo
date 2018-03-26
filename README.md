# Flipper Rails Demo

Step by step instructions for using [Flipper](https://featureflipper.com) with Rails.

## Step 1

Add `flipper-cloud` to the `Gemfile`.

```ruby
gem 'flipper-cloud', '~> 0.13.0'
gem 'flipper-active_record', '~> 0.13.0'
```

And run `bundle` to install.

## Step 2

Create an account on [featureflipper.com](https://featureflipper.com) and get the token provided during signup.

![screenshot of token](https://cl.ly/0B3c0X3S1Z3K/Image%202017-05-29%20at%204.03.58%20PM.public.png)

## Step 3

Create a new file `config/initializers/flipper.rb` with the following content:

```ruby
require "flipper/cloud"
require "flipper/adapters/active_record"

token = ENV.fetch("FLIPPER_TOKEN")
debug = ENV.fetch("FLIPPER_DEBUG", "0").to_i == 1
read_timeout = ENV.fetch("FLIPPER_READ_TIMEOUT", 5).to_f
open_timeout = ENV.fetch("FLIPPER_OPEN_TIMEOUT", 5).to_f
sync_interval = ENV.fetch("FLIPPER_SYNC_INTERVAL", 10_000).to_i

Flipper.configure do |config|
  config.default do
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
```

You can certainly strip parts of the above out, but this configuration is typical of a real production environment (strikingly similar to what we use for featureflipper.com itself).

## Step 4

Test that everything works from console:

```bash
FLIPPER_TOKEN=<token-goes-here> rails console
```

```ruby
irb(main):006:0> Flipper.enabled?(:foo)
=> false
irb(main):007:0> Flipper.enable(:foo)
=> true
irb(main):008:0> Flipper.enabled?(:foo)
=> true
```

Or test that it works using this demo application:

```bash
git clone https://github.com/fewerandfaster/flipper-rails-demo.git
cd flipper-rails-demo
FLIPPER_TOKEN=<token-from-step-2-goes-here> rails server
```

Open http://localhost:3000 in your browser.

![view on featureflipper.com](https://cl.ly/0d400Y081M04/Image%202017-05-29%20at%204.11.46%20PM.public.png)

## More?

Check out the [flipper README](https://github.com/jnunemaker/flipper) for links to more documentation and examples on the [types of enablements](https://github.com/jnunemaker/flipper/blob/master/docs/Gates.md) and how to [instrument](https://github.com/jnunemaker/flipper/blob/master/docs/Instrumentation.md) and [optimize](https://github.com/jnunemaker/flipper/blob/master/docs/Optimization.md) your usage of Flipper.
