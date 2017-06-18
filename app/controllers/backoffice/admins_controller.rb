class Backoffice::AdminsController < BackofficeController
 before_action :set_admin, only: [:edit, :update, :destroy]
 after_action :verify_authorized, only: [:new, :destroy]
 after_action :verify_policy_scoped, only: :index

  def index
  	# @admins = Admin.all #faz um select na tabela admin
    @admins = policy_scope(Admin)#vou utilizar o pundit e dependendo do usuario eu exibo todo mundo ou somente os restritos
  end

  def new #metodo para adicionar um novo admin
     @admin = Admin.new
     authorize @admin#pundit, procura metodo new na policy
  end

  def create
     @admin = Admin.new(params_admin)
     if @admin.save
        redirect_to backoffice_admins_path, notice: "O administrador (#{@admin.name}) foi cadastrado com sucesso."
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
        redirect_to backoffice_admins_path, notice: "O administrador (#{@admin.name}) foi atualizado com sucesso."
        AdminMailer.update_email(current_admin, @admin).deliver_now
     else
        render :edit
     end  
  end

  def destroy
    authorize @admin
    name_excluido = @admin.name

    if @admin.destroy
       redirect_to backoffice_admins_path, notice: "O administrador (#{name_excluido}) foi excluído com sucesso."
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
      if @admin.blank?
        params.require(:admin).permit(:name, :email, :role, :password, :password_confirmation)
      else
        params.require(:admin).permit(policy(@admin).permitted_attributes)
      end      
  end

  def password_blank?
    params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
  end

end
