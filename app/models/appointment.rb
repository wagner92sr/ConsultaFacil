class Appointment < ApplicationRecord
	validates_presence_of :date
	belongs_to :hospital
	belongs_to :doctor
end
