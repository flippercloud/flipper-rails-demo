module IconHelper
  def icon(name, additional_classes = nil, title: nil)
    class_name = name.gsub('_', '-')
    classes = "bi bi-#{class_name} #{additional_classes}"
    content_tag :svg, title: title, class: classes, fill: "currentColor", viewBox: "0 0 16 16" do
      content_tag :use, "", { "xlink:href": "#{image_path("bootstrap-icons.svg")}##{class_name}" }
    end
  end
end
