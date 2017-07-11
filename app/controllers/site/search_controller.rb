class Site::SearchController < SiteController
	#def hospitals
	#	@hospitals = Hospital.search_hospital(params[:q], params[:page])
	#	@doctors = Doctor.search_doctor(params[:q], params[:page])
	#end
	def search 
		@results = PgSearch.multisearch(params[:q])
	end
end
