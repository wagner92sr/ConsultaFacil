class Pacientes::SessionsController < Devise::SessionsController
  protected
    def after_sign_in_path_for(resource)
    	stored_location = stored_location_for(resource)

      if stored_location.match(site_profile_dashboard_index_path)
      	stored_location
      else
      	site_profile_dashboard_index_path
      end
    end

end



=begin
class Users::SessionsController < Devise::SessionsController
  protected
    def after_sign_in_path_for(resource)
      site_profile_dashboard_index_path
    end

end
=end