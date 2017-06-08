class Backoffice::AdminsController < BackofficeController
 before_action :set_admin, only: [:edit, :update, :destroy]

  def index
  	 @admins = Admin.all #faz um select na tabela admin
  end

  def new #metodo para adicionar um novo admin
     @admin = Admin.new
  end

  def create
     @admin = Admin.new(params_admin)
     if @admin.save
        redirect_to backoffice_admins_path, notice: "O administrador (#{@admin.email}) foi cadastrado com sucesso."
     else
        render :new
     end  
  end

  def edit #metodo para editar um admin
     #set_admin vou passar a chamar pelo before_action
  end

  def update
     #set_admin vou passar a chamar pelo before_action
     senha = params[:admin][:password]
     confirmacao_senha = params[:admin][:password_confirmation]
     #Ajuste para conseguir alterar somente o e-mail, mantendo a mesa senha
     if senha.blank? && confirmacao_senha.blank?
     	params[:admin].delete(:password)
     	params[:admin].delete(:password_confirmation)
     end

     if @admin.update(params_admin)
        redirect_to backoffice_admins_path, notice: "O administrador (#{@admin.email}) foi atualizado com sucesso."
     else
        render :edit
     end  
  end

  def destroy
    email_excluido = @admin.email

    if @admin.destroy
       redirect_to backoffice_admins_path, notice: "O administrador (#{email_excluido}) foi excluído com sucesso."
    else
       render :index
    end  
  end
  
  private

  def set_admin
     @admin = Admin.find(params[:id])
  end   
  #eu poderia passar isto no create, mas como ficaria muito grande, criei o metodo params_admin para poder reutilizar.
  def params_admin
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

end
