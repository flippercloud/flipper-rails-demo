# Flipper Rails Demo

Step by step instructions for using [Flipper](https://featureflipper.com) with Rails.

## Step 1

Add `flipper-cloud` to the `Gemfile`.

```ruby
gem 'flipper-cloud'
```

And run `bundle` to install. See [this commit](https://github.com/fewerandfaster/flipper-rails-demo/commit/6e743d16c55e0b84cc8dc571acf1a9510b424414).

## Step 2

Create an account on featureflipper.com and get the token provided during signup.

![screenshot of token](https://cl.ly/0B3c0X3S1Z3K/Image%202017-05-29%20at%204.03.58%20PM.public.png)

## Step 3

Create a new file `config/initializers/flipper.rb` with the following content:

```ruby
token = ENV.fetch("FLIPPER_TOKEN")

Flipper.configure do |config|
  config.default do
    Flipper::Cloud.new(token)
  end
end
```

## Step 4

Test that everything works.

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

![view on featureflipper.com](https://cl.ly/0d400Y081M04/Image%202017-05-29%20at%204.11.46%20PM.public.png)
