class Paciente < ApplicationRecord
	has_many :appointments
	has_one :profile_member
	has_one :medical_record
	accepts_nested_attributes_for :profile_member
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
