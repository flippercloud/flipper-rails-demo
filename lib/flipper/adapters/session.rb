require 'flipper'

# An adapter that uses the session to store features. This is really only useful
# for demos, but gives you an idea of how powerful Flipper adapters can be.
class Flipper::Adapters::Session < Flipper::Adapters::Memory
  def initialize(session, key: :flipper_features)
    # Initialize with the current value of the session
    super(session[key])

    # Save the normalized features back to the session
    session[key] = @source

    # Now just use the session as the source
    @source = session[key]
  end
end
