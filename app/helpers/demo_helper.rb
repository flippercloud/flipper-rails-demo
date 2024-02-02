module DemoHelper
  def controls(title)
    render 'shared/controls', title: do
      yield
    end
  end

  def flag_status(feature)
    feature = Flipper.feature(feature) if feature.is_a?(Symbol)
    render 'shared/flag_status', feature: do
      yield
    end
  end

  def status_item(label, condition, code = nil)
    render 'shared/status_item', label: , condition: , code:
  end

  def uses(examples)
    render 'shared/uses', examples: examples
  end

  def toggle(label:, form_target:, form_method: :post, ruby:, cli:)
    style = case form_method
            when :post then :success
            when :delete then :danger
            else :primary
            end
    render 'shared/toggle', label:, style:, form_target:, form_method:, ruby:, cli:
  end

  def next_button(label, target)
    render 'shared/next_button', label:, target:
  end
end
