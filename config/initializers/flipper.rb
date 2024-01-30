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
