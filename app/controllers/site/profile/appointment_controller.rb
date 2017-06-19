class Site::Profile::AppointmentController < Site::ProfileController
	def index
  	 @appointments = Appointment.all #faz um select na tabela appointmentwhere(paciente_id: current_paciente)
  end

  def new #metodo para adicionar um novo paciente
     @appointment = Appointment.new
  end

  def create
     @appointment = AppointmentService.create(params_appointment)
     unless  @appointment.errors.any?
        redirect_to backoffice_appointments_path, notice: "A consulta foi cadastrada com sucesso para a data (#{@appointment.date})."
     else
        render :new
     end  
  end

  def edit #metodo para editar um paciente
     #set_appointment vou passar a chamar pelo before_action
  end

  def update
     #set_appointment vou passar a chamar pelo before_action
     if @appointment.update(params_appointment)
        redirect_to backoffice_appointments_path, notice: "A consulta (#{@appointment.name}) foi atualizado com sucesso."
     else
        render :edit
     end  
  end

end
