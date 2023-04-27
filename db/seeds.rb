# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Generate the digest once so it's faster to seed the sample users
default_password_digest = BCrypt::Password.create('password', cost: 4)

(1..100).each do |number|
	%w[water tea coffee].each do |beverage|
		user = User.find_or_create_by(email: "#{beverage}+#{number}@example.com", password_digest: default_password_digest, beverage: beverage.to_sym)
	end
end
