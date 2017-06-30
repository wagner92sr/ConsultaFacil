namespace :dev do
  desc "Setup developmet"
  task setup: :environment do
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
#rake -T visualiza os rakes disponiveis
# rake utils:generate_admins