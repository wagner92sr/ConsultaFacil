class Site::Profile::AppointmentController < Site::ProfileController
  before_action :set_appointment, only: [:edit, :update]

	def index
  	 @appointments = Appointment.where(paciente_id: current_paciente.id) #faz um select na tabela appointmentwhere(paciente_id: current_paciente)
  end

  def new #metodo para adicionar um novo paciente
     @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(params_appointment)
    @appointment.paciente = current_paciente

    if @appointment.save
      redirect_to site_profile_appointment_index_path, notice: "Consulta atualizada com sucesso"
    else
      render :new
    end
    
  end

  def edit #metodo para editar um paciente
     
  end

  def update
  # "appointment"=>{"date"=>"2017-06-24", "hospital_id"=>"4", "doctor_id"=>"3", "paciente_id"=>"1", "observations"=>"Teste hhhh"}, "commit"=>"Atualizar", "id"=>"1"}
    if @appointment.update(params_appointment)
      redirect_to site_profile_appointment_index_path, notice: "Consulta atualizada com sucesso"
    else
      render :edit
    end
  end

  def backofficeAppointments
    @appointments = Appointment.all
  end



  private
  def set_appointment
    @appointment = Appointment.find_or_create_by(paciente_id: current_paciente.id)
  end

  def params_appointment
    params.require(:appointment).permit(:id, :date, :hospital_id, :doctor_id, :paciente_id, :observations)
  end

end
