class Site::SearchDoctorsController < SiteController
	def index
		@doctors = Doctor.all
	end

	def show
		@doctor = Doctor.find(params[:id])
	end
end
