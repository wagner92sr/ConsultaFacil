class AdminPolicy < ApplicationPolicy

  def new?
  	user.full_access?
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
