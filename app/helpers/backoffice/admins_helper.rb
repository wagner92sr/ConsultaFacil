module Backoffice::AdminsHelper

  OptionsForRoles = Struct.new(:id, :description)

  def options_for_roles
  	#options = []
#Sempre que uma colecao começa vazia, é populada e depois devolvida, podemos utilizar o map que faz isso em uma linha
    Admin.roles_i18n.map do |key, value| #Admin.roles_i18n.each do |key, value| 
      OptionsForRoles.new(key, value)#options.push(OptionsForRoles.new(key, value))
    end

   # options
  end
end
