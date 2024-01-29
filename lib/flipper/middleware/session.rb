# Middleware to configure flipper to use the Session adapter before each request
class Flipper::Middleware::Session
  def initialize(app, env_key: 'flipper')
    @app = app
    @env_key = env_key
  end

  def call(env)
    original_instance = Flipper.instance
    env[@env_key] = Flipper.instance = Flipper.new(Flipper::Adapters::Session.new(env['rack.session']))
    @app.call(env)
  ensure
    Flipper.instance = original_instance
  end
end
