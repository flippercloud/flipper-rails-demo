module FlagStateHelper
  def binary?(feature)
    !feature.conditional?
  end

  def actor_constrained?(feature)
    feature.enabled_gate_names.include?(:actor)
  end

  def group_constrained?(feature)
    feature.enabled_gate_names.include?(:group)
  end

  def percentage_of_time?(feature)
    feature.enabled_gate_names.include?(:percentage_of_time)
  end

  def percentage_of_actors?(feature)
    feature.enabled_gate_names.include?(:percentage_of_actors)
  end
end
