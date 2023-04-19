# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

default_password = BCrypt::Password.create(default_password, cost: 4)

(1..100).each do |number|
	User.find_or_create_by(email: "water+#{number}@example.com", password_digest: default_password, beverage: :water)
	User.find_or_create_by(email: "tea+#{number}@example.com", password_digest: default_password, beverage: :tea)
	User.find_or_create_by(email: "coffee+#{number}@example.com", password_digest: default_password, beverage: :coffee)
end

Rails.logger.info "Created 100 sample users each for water, tea, and coffee preferences."
