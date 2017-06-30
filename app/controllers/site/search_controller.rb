class Site::SearchController < SiteController
	def hospitals
		@hospitals = Hospital.search_hospital(params[:q])
	end
end
