# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'matt@matt.com', password: 'matt', full_name: 'Matt Mcgee', account_id: 2, role: 2)
User.create(email: 'john@john.com', password: 'john', full_name: 'John Johnson', account_id: 2, role: 3)
User.create(email: 'chris@chris.com', password: 'chris', full_name: 'Chris Evans', account_id: 2, role: 3)
User.create(email: 'alex@alex.com', password: 'alex', full_name: 'Alex Jones', account_id: 2, role: 3)
User.create(email: 'erin@erin.com', password: 'erin', full_name: 'Erin Butler', account_id: 2, role: 3)
User.create(email: 'nick@nick.com', password: 'nick', full_name: 'Nick Hofferman', account_id: 2, role: 3)