class Backoffice::DashboardController < BackofficeController

  def index
  	@appointments = Appointment.all
  end
end
