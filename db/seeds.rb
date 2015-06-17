# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

u3 = User.create({username: "boss", first_name:"boss", email: "afrttoh@gmx.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", last_name: "boss", phone: "9876543210", address_line1: "Address 1", address_line2: "Address 2", post_town: "Post Town", role_id: r3.id})
u3.confirm!
