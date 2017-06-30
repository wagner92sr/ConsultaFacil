class Site::AppointmentDetailsController < SiteController
	def show
		@appointment.find(params[:id])
	end
end
