module DemoHelper
  def controls(title)
    render 'shared/controls', title: title do
      yield
    end
  end

  def toggle(label:, form_target:, form_method: :post, code:)
    style = case form_method
            when :post then :success
            when :delete then :danger
            else :primary
            end
    render 'shared/toggle', label: label, style: style, form_target: form_target, form_method: form_method, code: code
  end
end
