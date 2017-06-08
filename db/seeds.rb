# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cadastrando hospitais"
Hospital.create!(name: "HOSPITAL VIDA ETERNA", address: "Rua inventada, 123", city: "Porto Alegre", phone: "2222-2222")
puts "Hospital cadastrado com sucesso"

puts "Cadastrando o administrador padrão"
Admin.create!(name: "Administrador Geral",
	          email: "admin@admin.com",
              password: "123456",
              password_confirmation: "123456",
              role: 0 
              )
puts "Administrador cadastrado com sucesso"