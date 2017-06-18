module Backoffice::AdminsHelper
=begin
  OptionsForRoles = Struct.new(:id, :description)

  def options_for_roles
    Admin.roles_i18n.map do |key, value| #roles_i18n.map
      OptionsForRoles.new(key, value)
    end
  end
=end
end
