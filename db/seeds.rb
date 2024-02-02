# Use a fixed seed to get deterministic results
Faker::Config.random = Random.new(42)
BEVERAGES = %w[unspecified water tea coffee]

(1..300).each do |id|
	User.find_or_create_by(
		id: id,
		name: Faker::Name.name,
		beverage: BEVERAGES[id % BEVERAGES.length]
	)
end
