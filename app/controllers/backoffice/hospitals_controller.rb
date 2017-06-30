class Backoffice::HospitalsController < BackofficeController  
  before_action :set_hospital, only: [:edit, :update]

  def index
  	 @hospitals = Hospital.all #faz um select na tabela hospital
  end

  def new #metodo para adicionar um novo hospital
     @hospital = Hospital.new
  end

  def create
     @hospital = HospitalService.create(params_hospital)
     unless  @hospital.errors.any?
        redirect_to backoffice_hospitals_path, notice: "O hospital (#{@hospital.name}) foi cadastrado com sucesso."
     else
        render :new
     end  
  end

  def edit #metodo para editar um hospital
     #set_hospital vou passar a chamar pelo before_action
  end

  def update
     #set_hospital vou passar a chamar pelo before_action
     if @hospital.update(params_hospital)
        redirect_to backoffice_hospitals_path, notice: "O hospital (#{@hospital.name}) foi atualizado com sucesso."
     else
        render :edit
     end  
  end
  
  private

  def set_hospital
     @hospital = Hospital.find(params[:id])
  end   
  #eu poderia passar isto no create, mas como ficaria muito grande, criei o metodo params_hospital para poder reutilizar.
  def params_hospital
      params.require(:hospital).permit(:name, :address, :city, :phone, :picture)
  end

end
