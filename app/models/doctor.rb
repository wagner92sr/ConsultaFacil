class Doctor < ApplicationRecord
	validates_presence_of :name, :crm
end
