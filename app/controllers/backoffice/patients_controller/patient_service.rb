class Backoffice::PatientsController::PatientService #POROS - Classes para tirar a responsabilidade dos controllers
	attr_accessor :patient

	def self.create(params_patient)
		@patient = Patient.new(params_patient)

		if @patient.valid?
			@patient.save!
		end

		@patient
	end
end