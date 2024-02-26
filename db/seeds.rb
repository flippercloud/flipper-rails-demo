# Use a fixed seed to get deterministic results
Faker::Config.random = Random.new(42)
BEVERAGES = %w[unspecified water tea coffee]
CATEGORIES = %w[basic basic basic beta beta internal]

(1..300).each do |id|
	User.find_or_create_by(
		id: id,
		name: Faker::Name.name,
		beverage: BEVERAGES[id % BEVERAGES.length],
		category: CATEGORIES[id % CATEGORIES.length]
	)
end
