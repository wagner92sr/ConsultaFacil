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

puts "Cadastrando o administrador básico"
Admin.create!(name: "Administrador basico",
	          email: "adminbasico@admin.com",
              password: "123456",
              password_confirmation: "123456",
              role: 1
              )
puts "Administrador básico cadastrado com sucesso"

puts "Cadastrando o paciente"
Paciente.create!(email: "paciente@paciente.com",
                  password: "123456",
                  password_confirmation: "123456"
                  )
puts "Paciente padão cadastrado com sucesso"

puts "Cadastrando CIDS"
cids = [  "A04.0",
          "A04.1",
          "A04.2",
          "A04.3",
          "A04.4",
          "A04.5",
          "A04.6",
          "A04.7",
          "A04.8",
          "A04.9" ]  
cids.each do |cid|
  Cid.create!(cid: cid)
end
                
namesCid = [ "Infecção por Escherichia coli enteropatogênica",
             "Infecção por Escherichia coli enterotoxigênica",
             "Infecção por Escherichia coli enteroinvasiva",
             "Infecção por Escherichia coli enterohemorrágica",
             "Outras infecções intestinais por Escherichia",
             "Enterite por Campylobacter",
             "Enterite devida a Yersinia enterocolitica",
             "Enterocolite devida a Clostridium difficileColite pseudomembranosaIntoxicação alimentar por Clostridium difficile",
             "Outras infecções bacterianas intestinais especificadas",
             "Infecção intestinal bacteriana não especificada" ]
                      
namesCid.each do |name|
  Cid.create!(name: name)
end
puts "CIDS criados com sucesso "