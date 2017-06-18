class AdminPolicy < ApplicationPolicy

  def new?
  	user.full_access?
  end

  def edit?
    user.full_access?
  end

  def destroy?
    user.full_access?
  end

  #controlar o que um usuároio pode editar, de acordo com o seu perfil
  def permitted_attributes
    if user.full_access?
      [:name, :email, :role, :password, :password_confirmation]
    else
      [:name, :email, :password, :password_confirmation]
    end
  end


  class Scope < Scope
    def resolve
      if user.full_access?
      	scope.all	
      else
      	scope.with_restricted_access #with blá blá herdado da classe Admin
      end
    end
  end
end
