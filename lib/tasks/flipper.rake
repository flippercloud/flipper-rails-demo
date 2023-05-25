namespace :flipper do
  desc "Ensures the flags have been created for the relevant features"
  task initialize: :environment do
    %i[demo demo_actor demo_group slow_roll].each do |feature|
      Flipper.add(feature)
    end
  end

end
