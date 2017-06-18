namespace :utils do
  desc "Criar administradores fakes"
  task generate_admins: :environment do
  	puts "Cadastrando administradores fakes.."

  	15.times do
  		Admin.create!(name: Faker::Name.name,
                    email: Faker::Internet.email,
                    password: "123456",
                    password_confirmation: "123456",
                    role: [0,0,1,1,1].sample
                    )
  	end
  	
    puts "Administrador cadastrado com sucesso!"
  end

end
