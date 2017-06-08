require 'test_helper'

class Backoffice::HospitalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_hospitals_index_url
    assert_response :success
  end

end
