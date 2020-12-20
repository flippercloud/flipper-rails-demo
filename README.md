# Flipper Rails Demo

Step by step instructions for using [Flipper](https://flippercloud.io) with Rails.

## Step 1

Add `flipper-cloud` to the `Gemfile`.

```ruby
flipper_version = '~> 0.20.0'
gem 'flipper-cloud', flipper_version
gem 'flipper-active_record', flipper_version
```

* Run `bundle` to install.
* Run `bin/rails g flipper:active_record` to generate migration for ActiveRecord adapter.
* Run `bin/rails db:migrate` to run migration for ActiveRecord adapter.

## Step 2

Create an account on [flippercloud.io](https://flippercloud.io) and get the token provided during signup.

## Step 3

Create a new file `config/initializers/flipper.rb` with the following content:

```ruby
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
```

## Step 4

Mount the flipper cloud webhook in your app by adding the following to `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  mount Flipper::Cloud.app, at: "_flipper"
end
```

We recommend using webhooks for syncing your application data with cloud. When changes happen (e.g. enable a feature), we'll ping your application and tell it to pull the latest information.

When developing locally on your machine, you can skip webhooks and use polling (the default `sync_method`). This avoids the hassle of setting up ngrok or the like to expose your local machine to the internet. Instead, `Flipper::Cloud` will poll every 10 seconds (you can configure this to be less or more using sync_interval).

## Step 5

### Configure cloud using ENV vars (preferred):

```
# required
FLIPPER_CLOUD_TOKEN=<your environment token here>

# optional (for production environment)
FLIPPER_CLOUD_SYNC_METHOD=webhook
FLIPPER_CLOUD_SYNC_SECRET=<webhook sync secret>
```

### Or, you can configure cloud using Ruby:

You can tweak the setup in Step 3 to look more like this:

```ruby
Flipper.configure do |config|
  config.default do
    Flipper::Cloud.new("<your environment token here>") do |cloud|
      cloud.sync_method = Rails.env.production? ? :webhook : :poll
      cloud.sync_secret = "<webhook sync secret>"
      cloud.local_adapter = Flipper::Adapters::ActiveRecord.new
    end
  end
end
```

## Step 6

Test that everything works from console:

```bash
FLIPPER_CLOUD_TOKEN=<token-goes-here> bin/rails console
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
FLIPPER_CLOUD_TOKEN=<token-from-step-2-goes-here> bin/rails server
```

Open http://localhost:3000 in your browser.

## More?

Head on over to the [Flipper Cloud documentation](https://www.flippercloud.io/docs).

Or check out the [flipper README](https://github.com/jnunemaker/flipper) for links to more documentation and examples on the [types of enablements](https://github.com/jnunemaker/flipper/blob/master/docs/Gates.md) and how to [instrument](https://github.com/jnunemaker/flipper/blob/master/docs/Instrumentation.md) and [optimize](https://github.com/jnunemaker/flipper/blob/master/docs/Optimization.md) your usage of Flipper.
