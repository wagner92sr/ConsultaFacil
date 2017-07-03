class Doctor < ApplicationRecord
	belongs_to :hospital
	validates_presence_of :name, :crm

	#paperclip
	has_attached_file :picture, styles: { medium: "300x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/


	#scopes
	scope :search_doctor, ->(q, page) { where("lower(name) LIKE ?", "%#{q.downcase}%").page(page).per(4)}
end
