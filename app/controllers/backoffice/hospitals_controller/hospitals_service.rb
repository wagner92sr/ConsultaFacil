class Backoffice::HospitalsController::HospitalService #POROS - Classes para tirar a responsabilidade dos controllers
	attr_accessor :hospital

	def self.create(params_hospital)
		@hospital = Admin.new(params_hospital)

		if @hospital.valid?
			@hospital.save!
		end

		@hospital
	end
end