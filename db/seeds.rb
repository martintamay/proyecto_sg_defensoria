# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
entity = Entity.new
entity.name= 'Admin'
entity.last_name= ''
entity.phone= ''
entity.birthdate= '2017-01-01'
entity.email= 'admin@defensoria.com'
entity.save

admin = User.new
admin.email = "admin@defensoria.com"
admin.password = "123456"
admin.entity = entity
admin.save
admin.revoke :default
admin.add_role :admin
