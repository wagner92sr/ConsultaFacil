class Appointment < ApplicationRecord	
	belongs_to :hospital
	belongs_to :doctor
	belongs_to :paciente

	validates :date, :hospital, :doctor, presence: true

	#constantes
  	ROLES = {:consulta_agendada => 1, :consulta_confirmada => 2, :consulta_cancelada => 3, :consulta_realizada => 4}
  	#enum role: [:full_access, :restricted_access]
	enum role: ROLES





end
