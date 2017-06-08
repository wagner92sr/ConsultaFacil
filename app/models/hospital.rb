class Hospital < ApplicationRecord
	validates_presence_of :name, :address, :city, :phone
end
