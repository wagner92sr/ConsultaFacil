class Backoffice::MedicalRecordController::MedicalRecordService
	attr_accessor :medical_record

	def self.create(params_medical_record)
		@medicalRecord = MedicalRecord.new(params_medical_record)

		if @medicalRecord.valid?
			@medicalRecord.save!
		end

		@medicalRecord
	end
end