# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Employee.create(name: "jake", pin: "11", manager: true)
Employee.create(name: "joe", pin: "22", manager: false)

(1..8).each do |t|
  Table.create(number: "#{t}", guests: "#{t+rand(4)}")
  Ticket.create(title: "#{5.times.map { (97+rand(25)).chr }.join}", table_id: t)
end
