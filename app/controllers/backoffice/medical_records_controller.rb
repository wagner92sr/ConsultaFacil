class Backoffice::MedicalRecordsController < BackofficeController
  before_action :set_medical_record, only: [:edit, :update]

	def index
		@medicalRecords = MedicalRecord.all
	end	

	def new
		@medicalRecord = MedicalRecord.new
	end
	
  def create
     @medicalRecord = MedicalRecord.new(params_medical_record)
     if @medicalRecord.save
        redirect_to backoffice_medical_records_path, notice: "O prontuário do paciente foi cadastrado com sucesso."
     else
        render :new
     end  
  end

  def edit #metodo para editar um doctor
     #set_doctor vou passar a chamar pelo before_action
  end

  def update
     #set_hospital vou passar a chamar pelo before_action
     if @medicalRecord.update(params_medical_record)
        redirect_to backoffice_medical_records_path, notice: "O prontuário do paciente foi atualizado com sucesso."
     else
        render :edit
     end  
  end

  private

  def set_medical_record
     @medicalRecord = MedicalRecord.find(params[:id])
  end   
  #eu poderia passar isto no create, mas como ficaria muito grande, criei o metodo params_medical_record para poder reutilizar.
  def params_medical_record
      #params.require(:medicalRecord).permit(:observations)
      params.permit(:observations)
  end

end
