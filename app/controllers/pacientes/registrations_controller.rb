class Pacientes::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters

  #before_filter

  def new
    build_resource({})
    resource.build_profile_member
    respond_with self.resource
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
        :sign_up,
        keys:[
          :email, :password, :password_confirmation,
          :profile_member_attributes => [:first_name, :second_name]
        ]
    )
  end

end