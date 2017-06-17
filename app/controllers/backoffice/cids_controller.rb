class Backoffice::CidsController < BackofficeController
  before_action :set_cid, only: [:edit, :update]

  def index
  	 @cids = Cid.all #faz um select na tabela cid
  end

  def new #metodo para adicionar um novo cid
     @cid = Cid.new
  end

  def create
     @cid = CidService.create(params_cid)
     unless  @cid.errors.any?
        redirect_to backoffice_cids_path, notice: "O cid (#{@cid.name}) foi cadastrado com sucesso."
     else
        render :new
     end  
  end

  def edit #metodo para editar um cid
     #set_cid vou passar a chamar pelo before_action
  end

  def update
     #set_cid vou passar a chamar pelo before_action
     if @cid.update(params_cid)
        redirect_to backoffice_cids_path, notice: "O cid (#{@cid.name}) foi atualizado com sucesso."
     else
        render :edit
     end  
  end
  
  private

  def set_cid
     @cid = Cid.find(params[:id])
  end   
  #eu poderia passar isto no create, mas como ficaria muito grande, criei o metodo params_cid para poder reutilizar.
  def params_cid
      params.require(:cid).permit(:cid, :name, :description)
  end

end