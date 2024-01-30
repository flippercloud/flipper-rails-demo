# So automatic. So fresh.
# This would be a good place for flipper groups.
#   Flipper.register(:admins) do |actor|
#     actor.try(:admin?)
#   end

Flipper.register(:coffee_drinkers) do |actor, context|
  # Since anything can be passed as the actor, make sure it responds to the
  #   relevant method we'll check against
  actor.respond_to?(:coffee?) && actor.coffee?
end

Rails.application.config.after_initialize do
  # Whenever the app loads fresh, disable all the features so it starts from
  # a consistent state each time.
  # You wouldn't normally want to do this, but for a demo, it's pretty handy.
  begin
    Flipper.features.each(&:disable)
  rescue
    # That's fine if the DB hasn't been created yet
  end
end
