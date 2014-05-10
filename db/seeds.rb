# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.find_or_initialize_by(name: "admin")
user.update(name: 'admin', email: 'admin@lazyvista.com', password: 'password', confirmed_at: Time.now, admin: true)