class Backoffice::PatientsController < BackofficeController
before_action :set_patient, only: [:edit, :update]

 def index
  	 @patients = Patient.all #faz um select na tabela patient
  end

  def new #metodo para adicionar um novo patient
     @patient = Patient.new
  end

  def create
     @patient = PatientService.create(params_patient)
     unless  @patient.errors.any?
        redirect_to backoffice_patients_path, notice: "O Paciente (#{@patient.name}) foi cadastrado com sucesso."
     else
        render :new
     end  
  end

  def edit #metodo para editar um patient
     #set_patient vou passar a chamar pelo before_action
  end

  def update
    
  end
  
  private

  def set_patient
     @patient = Patient.find(params[:id])
  end   
  #eu poderia passar isto no create, mas como ficaria muito grande, criei o metodo params_patient para poder reutilizar.
  def params_patient
      params.require(:patient).permit(:cpf, :name, :address, :city, :phone)
  end

end
