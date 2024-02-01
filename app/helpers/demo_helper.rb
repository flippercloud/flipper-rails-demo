module DemoHelper
  def controls(title)
    render 'shared/controls', title: title do
      yield
    end
  end

  def flag_status(flag)
    render 'shared/flag_status', flag: flag do
      yield
    end
  end

  def status_item(label, condition)
    render 'shared/status_item', label: label, condition: condition
  end

  def uses(examples)
    render 'shared/uses', examples: examples
  end

  def toggle(label:, form_target:, form_method: :post, code:, cli:)
    style = case form_method
            when :post then :success
            when :delete then :danger
            else :primary
            end
    render 'shared/toggle', label: label, style: style, form_target: form_target, form_method: form_method, code: code, cli: cli
  end

  def next_button(label, target)
    render 'shared/next_button', label: label, target: target
  end
end
