class Site::Profile::AppointmentsController::AppointmentService #POROS - Classes para tirar a responsabilidade dos controllers
	attr_accessor :appointment

	def self.create(params_appointment)
		@appointment = params_appointment.new(params_appointment)

		if @appointment.valid?
			@appointment.save!
		end

		@appointment
	end
end