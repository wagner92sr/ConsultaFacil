class Site::SearchController < SiteController
	def hospitals
		@hospitals = Hospital.search_hospital(params[:q], params[:page])
	end
end
