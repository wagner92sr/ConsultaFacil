class Hospital < ApplicationRecord
	has_many :doctors
	validates_presence_of :name, :address, :city, :phone
	#paperclip
	has_attached_file :picture, styles: { medium: "300x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/


	#scopes
	#scope :search, ->(q) { where("name LIKE ?", "%#{q}%") }
	scope :search_hospital, ->(q, page) { where("lower(name) LIKE ?", "%#{q.downcase}%").page(page).per(4)}
end