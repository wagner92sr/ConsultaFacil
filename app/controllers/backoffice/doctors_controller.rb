class Backoffice::DoctorsController < BackofficeController 
	before_action :set_doctor, only: [:edit, :update]

 def index
  	 @doctors = Doctor.all #faz um select na tabela doctor
  end

  def new #metodo para adicionar um novo doctor
     @doctor = Doctor.new
  end

  def create
     @doctor = DoctorService.create(params_doctor)
     unless  @doctor.errors.any?
        redirect_to backoffice_doctors_path, notice: "O Médico (#{@doctor.name}) foi cadastrado com sucesso."
     else
        render :new
     end  
  end

  def edit #metodo para editar um doctor
     #set_doctor vou passar a chamar pelo before_action
  end

  def update
    
  end
  
  private

  def set_doctor
     @doctor = Doctor.find(params[:id])
  end   
  #eu poderia passar isto no create, mas como ficaria muito grande, criei o metodo params_doctor para poder reutilizar.
  def params_doctor
      params.require(:doctor).permit(:name, :address, :city, :phone, :crm)
  end

end
