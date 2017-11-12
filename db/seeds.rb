# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
entity = Entity.create({name: 'Admin', last_name: '', phone: '', birthdate: '2017-01-01', email: 'admin'})
User.new({email: 'admin', encrypted_password: '21232f297a57a5a743894a0e4a801fc3', entity: entity}).save