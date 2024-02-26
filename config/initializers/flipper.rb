# So automatic. So fresh.
# This would be a good place for flipper groups.
#   Flipper.register(:admins) do |actor|
#     actor.try(:admin?)
#   end

Flipper.register(:coffee_drinkers) do |actor, context|
  actor.respond_to?(:coffee?) && actor.coffee?
end

Flipper.register(:paid) do |actor, context|
  actor.respond_to?(:paid?) && actor.paid?
end

Flipper.register(:internal) do |actor, context|
  actor.respond_to?(:internal?) && actor.internal?
end

Flipper.register(:beta) do |actor, context|
  actor.respond_to?(:beta?) && actor.beta?
end

