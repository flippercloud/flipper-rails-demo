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
      # new(
      #   title: "Backup Providers",
      #   desc: "A quick way to instantly toggle all connected systems from one provider to another in the case of downtime or degraded performance from a primary provider.",
      #   icon: "arrow-left-right",
      #   tags: [[:permanent, :success], [:internal, :secondary]]
      # ),
      new(
        title: "Managing External Tools",
        desc: "Provide toggles to developers so they can enable or disable functionality like development tools, support system widgets, or other tools that aren't always needed in every environment.",
        icon: "wrench-adjustable",
        custom_flag: :profiler,
        tags: [[:permanent, :success], [:internal, :secondary]]
      ),
      # new(
      #   title: "Managing Analytics/Telemetry",
      #   desc: "A way to disable analytics and telemetry tools in development and test environments while being able to quickly enable them when necessary to re-configure or make adjustments in development.",
      #   icon: "clipboard-data",
      #   tags: [[:permanent, :success], [:internal, :secondary]]
      # )
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
    File.exist?(to_partial_path)
  end

  def partial
    title.downcase.parameterize(separator: '_')
  end

  def to_partial_path
    "example/#{partial}"
  end
end
