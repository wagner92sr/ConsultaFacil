class MedicalRecord < ApplicationRecord
	belongs_to :hospital
	belongs_to :doctor
	belongs_to :paciente
	has_many :appointments

end
