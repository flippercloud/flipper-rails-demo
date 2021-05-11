# Flipper Rails Demo

Step by step instructions for using [Flipper](https://flippercloud.io) with Rails.

## Step 1

Add `flipper-cloud` to the `Gemfile`.

```ruby
flipper_version = '~> 0.21.0'
gem 'flipper-cloud', flipper_version
gem 'flipper-active_record', flipper_version
```

* Run `bundle` to install.
* Run `bin/rails g flipper:active_record` to generate migration for ActiveRecord adapter.
* Run `bin/rails db:migrate` to run migration for ActiveRecord adapter.

## Step 2

Create an account on [flippercloud.io](https://flippercloud.io) and get the token provided during signup.

## Step 3

### Configure cloud using ENV vars (preferred):

```
# required
FLIPPER_CLOUD_TOKEN=<your environment token here>

# optional (for production environment so you never poll cloud)
FLIPPER_CLOUD_SYNC_SECRET=<webhook sync secret>
```

## Step 4

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

## Dotenv

This app also ships with dotenv so if you `cp .env.example .env` and tweak the token, you won't need to export the FLIPPER_CLOUD_TOKEN env var anytime you load Rails.

## More?

Head on over to the [Flipper Cloud documentation](https://www.flippercloud.io/docs).

Or check out the [flipper README](https://github.com/jnunemaker/flipper) for links to more documentation and examples on the [types of enablements](https://github.com/jnunemaker/flipper/blob/master/docs/Gates.md) and how to [instrument](https://github.com/jnunemaker/flipper/blob/master/docs/Instrumentation.md) and [optimize](https://github.com/jnunemaker/flipper/blob/master/docs/Optimization.md) your usage of Flipper.
