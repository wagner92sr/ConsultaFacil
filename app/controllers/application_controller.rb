class ApplicationController < ActionController::Base

  #Pundit
  include Pundit
  #Se der erro no pundit, chama o metodo user_not_authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  layout :layout_by_resource

  protected

  def layout_by_resource
     if devise_controller? && resource_name == :admin
  	    "backoffice_devise"
     elsif devise_controller? && resource_name == :paciente
        "site_devise"
  	 else
  	    "application"
    end
  end
  #erro do pundit
  def user_not_authorized
    flash[:alert] = "Você não está autorizado a executar esta ação."
    redirect_to(request.referrer || root_path)
  end

end
