class Backoffice::DoctorsController::DoctorService #POROS - Classes para tirar a responsabilidade dos controllers
	attr_accessor :doctor

	def self.create(params_doctor)
		@doctor = Doctor.new(params_doctor)

		if @doctor.valid?
			@doctor.save!
		end

		@doctor
	end
end