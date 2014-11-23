# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create!(name: 'Super Bowl', year: 2015, location: "Glendale")
Event.create!(name: 'Burning Man', year: 2015, location: "Black Rock City")
Event.create!(name: 'NBA All-Star Game', year: 2015, location: "New York City")
Event.create!(name: 'Summer Olympics', year: 2016, location: "Rio de Janeiro")