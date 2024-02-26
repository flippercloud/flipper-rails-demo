module FlagStateHelper
  def binary?(feature)
    feature.enabled_gate_names == %i[boolean]
  end

  def actor_constrained?(feature)
    feature.enabled_gate_names.include?(:actor)
  end

  def group_constrained?(feature)
    feature.enabled_gate_names.include?(:group)
  end

  def percentage_of_time?(feature)
    feature.enabled_gate_names.include?(:percentage_of_time) &&
      feature.percentage_of_time_value < 100
  end

  def percentage_of_actors?(feature)
    feature.enabled_gate_names.include?(:percentage_of_actors)
  end
end
