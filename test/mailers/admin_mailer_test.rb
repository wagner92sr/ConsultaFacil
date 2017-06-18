require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
	def update_email
		AdminMailer.update_email(Admin.first, Admin.last)
	end
end
