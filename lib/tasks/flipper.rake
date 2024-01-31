namespace :flipper do
  desc "Ensures the flags have been created for the relevant features"
  task initialize: :environment do
    # Set up flags in Flipper Cloud for the example features
    examples = Example.list.map(&:flag).each do |feature|
      Flipper.add(feature)
    end

    # Set up the demo features...
    %i[
      demo
      demo_actor
      demo_group
      slow_roll
    ].each do |feature|
      Flipper.add(feature)
    end
  end

end
