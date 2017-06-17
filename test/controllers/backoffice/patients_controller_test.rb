require 'test_helper'

class Backoffice::PatientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_patients_index_url
    assert_response :success
  end

end
