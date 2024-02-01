require "flipper/cloud"

# Middleware to configure flipper to use the Session adapter before each request
class Flipper::Middleware::Session
  def initialize(app, env_key: 'flipper')
    @app = app
    @env_key = env_key
  end

  def call(env)
    original_instance = Flipper.instance

    env[@env_key] = Flipper.instance = self.class.configure(env['rack.session'])

    # Sync before making request
    Flipper.sync

    @app.call(env)
  ensure
    Flipper.instance = original_instance
  end

  # Returns a Flipper instance using the given session
  def self.configure(session, token: session[:cloud_token])
    adapter = Flipper::Adapters::Session.new(session)

    if token
      Flipper::Cloud.new(
        token: token,
        local_adapter: adapter,
        sync_secret: "disable polling"
      )
    else
      Flipper.new(adapter)
    end
  end
end
