class Site::SearchHospitalsController < SiteController
	def index
		@hospitals = Hospital.all
	end

	def show
		@hospital = Hospital.find(params[:id])
	end

end
