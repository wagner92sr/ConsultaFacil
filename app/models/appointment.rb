class Appointment < ApplicationRecord	
	belongs_to :hospital
	belongs_to :doctor
	belongs_to :paciente

	validates :date, :hospital, :doctor, presence: true
end
