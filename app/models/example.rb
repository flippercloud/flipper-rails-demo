class Example
  attr_accessor :title, :desc, :icon, :custom_flag, :tags

  def self.list
    [
      new(
        title: "Circuit Breakers",
        desc: "A quick way to temporarily enable or disable a single service for everyone or only affected users when that service isn't performing at 100%.",
        icon: "cpu",
        custom_flag: :search,
        tags: [[:permanent, :success], [:internal, :secondary]]
      ),
      new(
        title: "Backup Providers",
        desc: "A quick way to instantly toggle all connected systems from one provider to another in the case of downtime or degraded performance from a primary provider.",
        icon: "arrow-left-right",
        custom_flag: :email_backup,
        tags: [[:permanent, :success], [:internal, :secondary]]
      ),
      new(
        title: "Managing External Tools",
        desc: "Provide toggles to developers so they can enable or disable functionality like development tools, support system widgets, or other tools that aren't always needed in every environment.",
        icon: "wrench-adjustable",
        custom_flag: :profiler,
        tags: [[:permanent, :success], [:internal, :secondary]]
      ),
      new(
        title: "Incremental Feature Releases",
        desc: "An example of gradually expanding the audience for a given feature in order to find problems before releasing it to more people.",
        icon: "circle-half",
        custom_flag: :reporting,
        tags: [[:temporary, :info], [:external, :warning]]
      )
    ]
  end

  def initialize(title:, desc:, icon:, custom_flag: nil, tags: [])
    @title = title
    @desc = desc
    @icon = icon
    @custom_flag = custom_flag
    @tags = tags
  end

  def flag
    (custom_flag || partial).to_sym
  end

  def slug
    title.downcase.parameterize
  end

  def exists?
    File.exist?(example_file)
  end

  def partial
    title.downcase.parameterize(separator: '_')
  end

  def to_partial_path
    "example/#{partial}"
  end

  private

  def example_file
    Rails.root.join("app/views/example/_#{partial}.html.erb")
  end
end
